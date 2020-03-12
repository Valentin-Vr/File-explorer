#include "executionfile.h"
#include <QQuickView>
#include <QDesktopServices>

ExecutionFile::ExecutionFile(QQuickItem *parent): QQuickPaintedItem(parent)
{

}

void ExecutionFile::paint(QPainter *painter)
{
    QPixmap pixmap(m_filePath);
    QRectF source(0, 0, 0, 0);
    QRectF imageRect = boundingRect();
    imageRect.setSize(pixmap.size().scaled(boundingRect().size().toSize(),Qt::KeepAspectRatio));
    imageRect.moveCenter(boundingRect().center());
    painter->drawPixmap(imageRect, pixmap, source);
}

void ExecutionFile::openFile(const QString &path, const QString &flag)
{
    if (flag == "jpg" || flag == "jpeg" || flag == "png") {
        QQuickView view;
        view.setSource(QStringLiteral("qrc:/FileOpenWindow.qml"));
        QQuickPaintedItem::update();
    } else {
        QDesktopServices::openUrl(QUrl::fromLocalFile(path));
    }
}

void ExecutionFile::filePath(const QString &path)
{
    if (m_filePath == path)
        return;
    m_filePath = path;
    update();
}
