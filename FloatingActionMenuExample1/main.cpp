#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "floatingactions.hpp"
#include "floatingactionsbottomright.hpp"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    QGuiApplication app {argc, argv};
    QQmlApplicationEngine engine;
    FloatingActions::initialize(engine.rootContext(), &app);

    FloatingActionsBottomRight* floatingActionsBottomRight =
        FloatingActions::createInstance<FloatingActionsBottomRight>("MenuBottomRight", "ButtonsBottomRight",engine.rootContext(),&app );

    if ( floatingActionsBottomRight == nullptr )
    {
        qDebug() << "Failed to create FloatingActionsBottomRight instance.  Application is exiting";
        app.exit();
    }
    else
    {
        engine.load(QUrl {QStringLiteral("qrc:/main.qml")});
        auto rootObjects = engine.rootObjects();
        if (rootObjects.count() < 1)
        {
            qDebug() << "Failed to load Qml.  Application is exiting";
            app.exit();
        }
        else
        {
            floatingActionsBottomRight->assignSlots(rootObjects[0]);
        }
    }

    return app.exec();
}
