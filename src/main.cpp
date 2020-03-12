#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fileslist.h"
#include "executionfile.h"
#include "contextmenu.h"

static QObject *menu_context(QQmlEngine *, QJSEngine *)
{
    return new ContextMenu;
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<FilesList>("space.developers", 1, 0, "NewTable");
    qmlRegisterType<ExecutionFile>("space.developers", 1, 0, "WorkFile");
    qmlRegisterSingletonType<ContextMenu>("space.developers", 1, 0, "ContextMenu",menu_context);

    QQmlApplicationEngine engine;


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
