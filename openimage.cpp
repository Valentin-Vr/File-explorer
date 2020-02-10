#include "openimage.h"
#include <QPixmap>
#include <QPainter>
#include <QSize>

openimage::openimage(QQuickItem* pqi /*= 0*/) : QQuickPaintedItem(pqi)
//  , m_color(Qt::black)
{

}

void openimage::paint(QPainter *ppainter)
{
    QPixmap pixmap("C:/Users/User/Desktop/img.jpg");
    QRectF source(0, 0, 0, 0);
    QRectF imageRect = boundingRect();
    imageRect.setSize(pixmap.size().scaled(boundingRect().size().toSize(),Qt::KeepAspectRatio));
    imageRect.moveCenter(boundingRect().center());
    ppainter->drawPixmap(imageRect, pixmap, source);
}

//void openimage::setColor(const QColor &col)
//{
//    m_color  = col;
//}

//QColor openimage::color() const
//{
//    return m_color;
//}
