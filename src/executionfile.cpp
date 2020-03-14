#include "executionfile.h"
#include <QQuickView>
#include <QDesktopServices>

ExecutionFile::ExecutionFile(QQuickItem *parent): QQuickPaintedItem(parent)
{

}

void ExecutionFile::paint(QPainter *painter)
{
    qDebug() << "paint" << m_filePath;
    QPixmap pixmap("C:/Users/User/Desktop/img.jpg");
    QRectF source(0, 0, 0, 0);
    QRectF imageRect = boundingRect();
    imageRect.setSize(pixmap.size().scaled(boundingRect().size().toSize(),Qt::KeepAspectRatio));
    imageRect.moveCenter(boundingRect().center());
    painter->drawPixmap(imageRect, pixmap, source);
}

void ExecutionFile::openFile(const QString &path)
{
    QDesktopServices::openUrl(QUrl::fromLocalFile(path));
}

void ExecutionFile::filePath(const QString &path)
{
    if (m_filePath == path)
        return;
    m_filePath = path;
    update();
}

void ExecutionFile::openImage(const QString &path)
{
    filePath(path);
    qDebug() << "m_filePath =" << m_filePath;
    QQuickPaintedItem::update();
}
