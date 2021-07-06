﻿using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Web;

namespace LandeWebProjectV1.Controllers
{
    public class CompressionUtils
    {
        private static Guid Version2Prefix = new Guid("DA088B12-6641-413b-BBFC-2829752DCF96");
        private const string Version2XafCompressedYesString = "+";
        private const string Version2XafCompressedNoString = "-";
        private const int MinAlwaysCompressedLenght = 1000000;
        private static MemoryStream DecompressData(MemoryStream ms)
        {
            int BufferSize = 5196;
            MemoryStream result = new MemoryStream();
            using (GZipStream inStream = new GZipStream(ms, CompressionMode.Decompress, true))
            {
                byte[] buffer = new byte[BufferSize];
                while (true)
                {
                    int readCount = inStream.Read(buffer, 0, BufferSize);
                    if (readCount == 0)
                    {
                        break;
                    }
                    result.Write(buffer, 0, readCount);
                }
            }
            return result;
        }
        private static MemoryStream DecompressVersion2Stream(MemoryStream ms)
        {
            byte[] header = new byte[System.Text.Encoding.UTF8.GetBytes(Version2XafCompressedYesString.ToCharArray()).Length];
            ms.Read(header, 0, header.Length);
            string headerString = System.Text.Encoding.UTF8.GetString(header, 0, header.Length);
            if (headerString == Version2XafCompressedYesString)
            {
                return DecompressData(ms);
            }
            if (headerString == Version2XafCompressedNoString)
            {
                MemoryStream result = new MemoryStream();
                while (ms.Position < ms.Length)
                {
                    result.WriteByte((byte)ms.ReadByte());
                }
                return result;
            }
            throw new ArgumentException();
        }
        public static MemoryStream Decompress(MemoryStream data)
        {
            if (data != null && data.Length > 0)
            {
                long startPosition = data.Position;
                byte[] guidPrefix = new byte[16];
                data.Read(guidPrefix, 0, guidPrefix.Length);
                if (new Guid(guidPrefix) == Version2Prefix)
                {
                    return DecompressVersion2Stream(data);
                }
                else
                {
                    data.Position = startPosition;
                    return DecompressData(data);
                }
            }
            return data;
        }
    }
}