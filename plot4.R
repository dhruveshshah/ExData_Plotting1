df <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)
colnames(df) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
datetime <- strptime(paste(df$Date, df$Time, sep=' '), format = '%d/%m/%Y %H:%M:%S')
df <- data.frame(datetime, df[, c(3:5,7:9)])
png('plot4.png')
par(mfrow=c(2,2))

with(df,{plot(Global_active_power ~ datetime, type = 'l', xlab = '', ylab = 'Global Active Power')
  plot(Voltage ~ datetime, type = 'l')
  
  plot(Sub_metering_1 ~ datetime, col = c('black', 'red', 'blue'), type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(Sub_metering_2 ~ datetime, col = 'red')
  lines(Sub_metering_3 ~ datetime, col = 'blue')
  legend('topright', bty = 'n', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, lwd = 1, cex=0.95)
  plot(Global_reactive_power ~ datetime, type = 'l')
}
)
dev.off()
