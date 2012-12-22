# TODO: Add comment
# 
# Author: aborodya
###############################################################################

#source('TestScript.R')

require(gplots)
require(RBloomberg)

securities = c("VFINX", "VAAPX","VBINX","VHCOX","VCVLX","VCVSX"
				,"VDMIX","VDEQX","VDAIX","VDIGX","VEIEX","VGENX","VEIPX"
				,"VEURX","VEXPX","VEXMX","VFWIX","VFTSX","VFIIX","VHGEX" 
				,"VGEQX","VIGRX","VQNPX","VGHCX","VHDYX","VWEHX","VIPSX" 
				,"VBIIX","VFICX","VFITX","VINEX","VWIGX","VTRIX","VLACX" 
				,"VSCGX","VASGX","VASIX","VSMGX","VBLTX","VWESX","VUSTX" 
				,"VMGRX","VMGIX","VIMSX","VMVIX","VMRGX","VPCCX","VPACX"
				,"VGPMX","VGSIX","VGSTX","VASVX","VBISX","VSGBX","VFSTX" 
				,"VFISX","VISGX","NAESX","VISVX","VSEQX","VSTCX","VTOVX" 
				,"VTENX","VTXVX","VTWNX","VTTVX","VTHRX","VTTHX","VFORX" 
				,"VTIVX","VFIFX","VTINX","VBMFX","VGTSX","VTSMX","VTWSX" 
				,"VWUSX","VUVLX","VIVAX","VWINX","VWELX","VWNDX","VWNFX"
				)

securities = paste(securities, 'Equity')

conn=blpConnect()

tmpBbgData = bdh(conn, securities, "PX_LAST", "20000101", "20120116")

blpDisconnect(conn)

require(timeSeries)
priceHistory=timeSeries(unstack(tmpBbgData, PX_LAST~ticker), unique(tmpBbgData$date))

tmpCorr=cor(priceHistory, use='pairwise.complete.obs')

require(fBasics)
heatmap.2.cust(tmpCorr
				, trace='none', col=timPalette()[12:64]
				, symm=T, Rowv=T
				, dendrogram='none'
				, tracecol='white'
				, cellnote=round(tmpCorr,2), notecex=0.4, cexRow=0.5
				, cexCol=0.5, notecol='black'
				, density.info='none'
				, key=F
				, lwid=c(1,7), lhei=c(1,7))
				#, margins=c(5,5))


