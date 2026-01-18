#!/bin/bash

FABRIC="/mnt/ssd/qaalabs/fabric/mslearn"
MSLEARN="/mnt/ssd/qaalabs/mslearn-fabric/Instructions/Labs"

# See if directories exist
if [[ ! -d ${FABRIC} ]]; then
  echo "Error: Directory not found ~ ${FABRIC}"
  exit 1
fi 
if [[ ! -d ${MSLEARN} ]]; then
  echo "Error: Directory not found ~ ${MSLEARN}"
  exit 2
fi 

LAB="$1"

case $LAB in
  "01")
    LABFILE="01-lakehouse.md"
    ;;
  "03b")
    LABFILE="03b-medallion-lakehouse.md"
    ;;
  "04")
    LABFILE="04-ingest-pipeline.md"
    ;;
  "05")
    LABFILE="05-dataflows-gen2.md"
    ;;
  "06")
    LABFILE="06-data-warehouse.md"
    ;;
  "06c")
    LABFILE="06c-monitor-data-warehouse.md"
    ;;
  "09")
    LABFILE="09-real-time-analytics-eventstream.md"
    ;;
  "11")
    LABFILE="11-data-activator.md"
    ;;
  "18")
    LABFILE="18-monitor-hub.md"
    ;;
  "19")
    LABFILE="19-secure-data-access.md"
    ;;
  "20")
    LABFILE="20-work-with-database.md"
    ;;
  "21")
    LABFILE="21-deployment-pipelines.md"
    ;;
  *)
    LABFILE="unknown"
    ;;
esac
echo $LABFILE

# See if files exists
if [[ ! -f ${FABRIC}/${LABFILE} ]]; then
  echo "Error: File not found ~ ${FABRIC}/${LABFILE}"
  exit 3
fi 
if [[ ! -f ${MSLEARN}/${LABFILE} ]]; then
  echo "Error: File not found ~ ${MSLEARN}/${LABFILE}"
  exit 4
fi 

# Show the difference in the 2 files
diff ${FABRIC}/${LABFILE} ${MSLEARN}/${LABFILE}

#EOF
