import QtQuick 2.12

ShaderEffect {

    property var source

    // the API for this item type
    // https://doc.qt.io/qt-5/qml-qtquick-shadereffect.html

    // RESTRICTIONS: limit yourself to OpenGL ES 2.0 features

    // TODO: correct the orientation of the image

    vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 coord;
                void main() {
                    coord = qt_MultiTexCoord0;
                    gl_Position = qt_Matrix * qt_Vertex;
                }"

    // TODO: make the coloured parts of the image green rather than purple

    // inputs
    // coord: texture coordinates
    // source: a sampler2d of the input texture
    // qt_Opacity: items opacity

    fragmentShader: "
                varying highp vec2 coord;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec4 tex = texture2D(source, coord);
                    gl_FragColor = tex * qt_Opacity;
                }"
}
