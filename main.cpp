#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <openpdf.h>
#include <QQmlContext>
#include <openimage.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    OpenPDF openpdf;

    qmlRegisterType<openimage>("newType", 1, 0, "NewType");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myData", &openpdf);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
