#ifndef KANNADAPLUGIN_H
#define KANNADAPLUGIN_H

#include <QObject>
#include "languageplugininterface.h"
#include "westernlanguagesplugin.h"

//#include <presage.h>

class KannadaPlugin : public WesternLanguagesPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "io.maliit.keyboard.LanguagePlugin.1" FILE "kannadaplugin.json")
    Q_INTERFACES(LanguagePluginInterface)

public:
    explicit KannadaPlugin(QObject* parent = nullptr)
        : WesternLanguagesPlugin(parent)
    {
    }

    ~KannadaPlugin() override = default;
};

#endif // KANNADAPLUGIN_H
