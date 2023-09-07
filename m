Return-Path: <ksummit+bounces-1085-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07519796F2B
	for <lists@lfdr.de>; Thu,  7 Sep 2023 05:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE381C20B29
	for <lists@lfdr.de>; Thu,  7 Sep 2023 03:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971FEEBF;
	Thu,  7 Sep 2023 03:07:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80571A21
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 03:07:33 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34e26daab46so1733925ab.0
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 20:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694056052; x=1694660852; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e14vUEecm32PhguM8gY/B9eU6Ea95+R4btvZDIK0VTQ=;
        b=qR+u1g9arafwa+NzKuHOov1Y9EA7ORsKAMsYLplGyKvVx97k7OriBAbaRDCDU7D4Gf
         NIyrUQhIp3cbmtw3D9zpzWlzFQXEuUJDZeiLVMdicbSypPxZ1Xui/a7QjF/lzQwdJfRa
         ddL43hk5cfSBvVgHSoqqDrGFaKZtSRq4Aq4DW1t7aPzrCzdeDxV3zFZILW2Y8kkjC1uQ
         rABkZ+BjgZdzHOrdw/9rhacC+am9XrfpvIruvogZP3PyBjqoAxnYKKejjQYUJjLDh2g9
         hxElZR9taO52Nw7/fk0OPxc5EQ4Jk/KUd1j1PpiPcJ46h0/TvgjDvS+WFuTMf6g4tueJ
         O82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694056052; x=1694660852;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e14vUEecm32PhguM8gY/B9eU6Ea95+R4btvZDIK0VTQ=;
        b=QnpioXokYkmoJIpcAiHebwioXKJpiM7jvWPXK5IF+/X/fId9wkzjL5JkrabYebfFUT
         pk9qwdZI3Yqg2FU5M0Pf5KtQLdJYXsW4YvjAr9dWT5y86G8jhFzMTJJ3W+l6OSY8zV3R
         We8p+6vVyLwYGtgUDVKcAkwFdXjWEG0lkrBa0dmTCTFnM8XW5iVHTn0JLzCgjhmGMWOS
         /fnTJbKmDO/S4Sru9WzcB9W+rzesNYIrtUNG37+6HD10OPnaqQoqWsOosTHaJdZ30USw
         NuJtAwyuJKpM7dXty2e+J8J5KEtXjnABzzELJiX/1D81V0Wa37CbRmpBh4HHM+SpD9pp
         k/Bw==
X-Gm-Message-State: AOJu0Yz40viPT16AVRdZ+SJ+Vx7vah2foPtXREu+wukpNR2CX2sC6tN4
	rsFKAhTFNwteMZz8hhJAj9U=
X-Google-Smtp-Source: AGHT+IFROPavogwHRiRKuDteBbOkkS76nuUnDSbo+6C1fwJMBnMNu74dyAtpdYGWjtq7ewQyl45t8g==
X-Received: by 2002:a92:cb4e:0:b0:34c:d86f:46e9 with SMTP id f14-20020a92cb4e000000b0034cd86f46e9mr18632992ilq.12.1694056052271;
        Wed, 06 Sep 2023 20:07:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 28-20020a17090a195c00b00262d662c9adsm504311pjh.53.2023.09.06.20.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 20:07:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cf96f345-50ec-e3bc-b2a7-4769b7891a9e@roeck-us.net>
Date: Wed, 6 Sep 2023 20:07:30 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkdxMh7jt5A7x67@debian.me>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
In-Reply-To: <ZPkdxMh7jt5A7x67@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/23 17:48, Bagas Sanjaya wrote:
[ ... ]
>> Case in point: After this e-mail, I tried playing with a few file systems.
>> The most interesting exercise was with ntfsv3.
>> Create it, mount it, copy a few files onto it, remove some of them, repeat.
>> A script doing that only takes a few seconds to corrupt the file system.
>> Trying to unmount it with the current upstream typically results in
>> a backtrace and/or crash.
> 
> Did you forget to take the checksum after copying and verifying it
> when remounting the fs?
> 
Sorry, I don't understand what you mean. I didn't try to remount.
The file system images in my tests are pristine, as created with mkfs, and
are marked read-only to prevent corruption. They are also md5 checksum
protected and regenerated before the test if there is a checksum mismatch.
For ntfs, the file system was created with

truncate -s 64M myfilesystem
mkfs.ntfs -F -H 1 -S 16 -p 16 myfilesystem

My tests run under qemu, and always use the -snapshot option.

The "test", if you want to call it that, is a simple

mount "${fstestdev}" /mnt
cp -a /bin /usr /sbin /etc /lib* /opt /var /mnt
rm -rf /mnt/bin
cp -a /bin /usr /sbin /etc /lib* /opt /var /mnt
umount /mnt

This is with a buildroot generated root file system. "cp -a" is a recursive
copy which copies symlinks.

If the file system is ntfs3, the rm command typically fails, complaining
that /mnt/bin is not empty. The umount command typically results in at
least a traceback, and often a crash. Repeating the cp; rm; cp sequence
multiple times quite reliably results in a file system corruption.

The resulting (corrupted or not) file system is discarded after the qemu
session.

Guenter


