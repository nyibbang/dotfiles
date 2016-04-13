iso2utf8()
{
    latin='ISO-8859'
    utf='UTF-8'

    for filename in "$@"
    do
        ENCODING=$(file "$filename")
        if [[ "$ENCODING" =~ "$latin" ]]; then
            echo "Reencoding $filename into $utf"
            iconv -f ${latin}-16 -t $utf "$filename" > tmp.file
            mv tmp.file "$filename"
        fi
    done
}
