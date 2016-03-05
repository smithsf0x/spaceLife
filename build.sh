# @Author: smithsf0x
# @Date:   2016-03-02 19:32:33
# @Last Modified by:   smithsf0x
# @Last Modified time: 2016-03-02 19:44:54

GNAME="spaceLife"

cd src && \
zip -9 -q -r ../$GNAME.love . && \
cd .. && \
mv $GNAME.love game/$GNAME.app/Contents/Resources/$GNAME.love
