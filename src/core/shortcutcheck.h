#ifndef SHORTCUTCHECK_H
#define SHORTCUTCHECK_H

#include <QKeySequence>
#include <QString>

//Whether a key can be given to something new (the marker presets): what SavvyCAN, Qt and the desktop already use it
//for; keep this list in step with the application's shortcuts and common desktop keys.
class ShortcutCheck
{
public:
    enum Verdict { Free, Warn, Refused };

    //reason: what uses the key ("Open Log File"), empty when it's free
    static Verdict check(const QKeySequence &key, QString &reason);
};

#endif // SHORTCUTCHECK_H
