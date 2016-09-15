#include "chewingplugin.h"
#include "chewinglanguagefeatures.h"

#include <QDebug>

ChewingPlugin::ChewingPlugin(QObject *parent) :
    AbstractLanguagePlugin(parent)
  , m_chewingLanguageFeatures(new ChewingLanguageFeatures)
  , m_processingWord(false)
{
    m_chewingThread = new QThread();
    m_chewingAdapter = new ChewingAdapter();
    m_chewingAdapter->moveToThread(m_chewingThread);

    connect(m_chewingAdapter, SIGNAL(newPredictionSuggestions(QString, QStringList)), this, SLOT(finishedProcessing(QString, QStringList)));
    connect(this, SIGNAL(parsePredictionText(QString)), m_chewingAdapter, SLOT(parse(QString)));
    connect(this, SIGNAL(candidateSelected(QString)), m_chewingAdapter, SLOT(wordCandidateSelected(QString)));
    m_chewingThread->start();
}

ChewingPlugin::~ChewingPlugin()
{
    m_chewingAdapter->deleteLater();
    m_chewingThread->quit();
    m_chewingThread->wait();
}

void ChewingPlugin::predict(const QString& surroundingLeft, const QString& preedit)
{
    Q_UNUSED(surroundingLeft);
    m_nextWord = preedit;
    if (!m_processingWord) {
        m_processingWord = true;
        Q_EMIT parsePredictionText(preedit);
    }
}

void ChewingPlugin::wordCandidateSelected(QString word)
{
    Q_EMIT candidateSelected(word);
}

AbstractLanguageFeatures* ChewingPlugin::languageFeature()
{
    return m_chewingLanguageFeatures;
}

void ChewingPlugin::finishedProcessing(QString word, QStringList suggestions)
{
    Q_EMIT newPredictionSuggestions(word, suggestions);
    if (word != m_nextWord) {
        Q_EMIT(parsePredictionText(word));
    } else {
        m_processingWord = false;
    }
}
