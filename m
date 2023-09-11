Return-Path: <ksummit+bounces-1125-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95179AA9A
	for <lists@lfdr.de>; Mon, 11 Sep 2023 19:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89A421C2084C
	for <lists@lfdr.de>; Mon, 11 Sep 2023 17:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC3156DB;
	Mon, 11 Sep 2023 17:45:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA147AD2E
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 17:45:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c06f6f98c0so39518195ad.3
        for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 10:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694454334; x=1695059134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmhLML4KpR4efDlZrStXoV2DBR7UACdYfD3+iLTBzB0=;
        b=f7iUB9I/EecYpEFBuIPCkSRaD1/OSVoYR2PxiRktdU/t0yINU+8k/aWP9TYDrVxXvm
         WvQQ5OHp0o+pyBtoNYISPkzW6VsNWp4eC255iZKySIv3EknPDI6ElR/WFKk2hPk8BJuN
         KvqfdatENnkvdl9/SrR3OJzzPGisrbUEfENn9PKgCJQvBa2ko6WqdR9p7IRxL0tq//L0
         Rzo+96kCDCETA//kFA76gCbxAA5Vg6CyCl7ONPvaPL0w4hwntkZsTDnO6JE4jZv1b34C
         s8pWMV/mBlSDbnMt1ep50bwdmqgNKOfKNB4pSYPpjSsgWkkBDFglCM2TJYkUhM8zYObj
         wKng==
X-Gm-Message-State: AOJu0YxXARTuxE5PNhB7SAApA+HunSUW4rmEBgVngEaBIfo2LiJlrUcM
	fa+h8t3C35DUYnt8pEHKC4k=
X-Google-Smtp-Source: AGHT+IGAK1vwR2Dtvo6dIMcAFPA8RxqV5y2QVj7GHOxfrQJ5uzFSxcAdrqQPGc2hdLaQLMx2eo6DMw==
X-Received: by 2002:a17:902:9046:b0:1c3:c5b5:8a83 with SMTP id w6-20020a170902904600b001c3c5b58a83mr1333592plz.4.1694454333824;
        Mon, 11 Sep 2023 10:45:33 -0700 (PDT)
Received: from ?IPV6:2601:647:5f00:5f5:4a46:e57b:bee0:6bc6? ([2601:647:5f00:5f5:4a46:e57b:bee0:6bc6])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902694400b001b531e8a000sm6712119plt.157.2023.09.11.10.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 10:45:33 -0700 (PDT)
Message-ID: <3c66d844-67e5-82d2-6d14-9f6c6b6fcc36@acm.org>
Date: Mon, 11 Sep 2023 10:45:31 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: David Disseldorp <ddiss@suse.de>, Dave Chinner <david@fromorbit.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Hajime Tazaki <thehajime@gmail.com>,
 Octavian Purdila <tavi.purdila@gmail.com>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <ZP5nxdbazqirMKAA@dread.disaster.area>
 <20230911012914.xoeowcbruxxonw7u@moria.home.lan>
 <ZP52S8jPsNt0IvQE@dread.disaster.area>
 <20230911153515.2a256856@echidna.fritz.box>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230911153515.2a256856@echidna.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/23 06:35, David Disseldorp wrote:
> The LKL block layer may also become useful for legacy storage support in
> future, e.g. SCSI protocol obsolescence.

There are probably more Linux devices using SCSI than NVMe. There are 
several billion Android phones in use. Modern Android phones use UFS 
storage. UFS is based on SCSI. There are already UFS devices available 
that support more than 300K IOPS and there are plans for improving 
performance further. Moving the SCSI stack to user space would have a
very significant negative performance impact on Android devices.

Bart.


