#!/bin/env bash
distribution_kind=$1
distribution_kind_valids="patch minor major"
tagname=$(npm version $distribution_kind)

if [ ! -n "$( echo $distribution_kind_valids | xargs -n1 echo | grep -e \"^$distribution_kind$\" )"  ]
then
	echo "bad distribution kind : $distribution_kind"
	exit 1
fi

echo "distributing ${distribution_kind} release : ${tagname}"
git add package.json
git commit -m "tag ${tagname}"
git tag "${tagname}"
git push -u origin master --tags
