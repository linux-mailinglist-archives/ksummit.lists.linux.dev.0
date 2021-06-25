Return-Path: <ksummit+bounces-228-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979B3B4724
	for <lists@lfdr.de>; Fri, 25 Jun 2021 18:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 29A333E0FE0
	for <lists@lfdr.de>; Fri, 25 Jun 2021 16:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D036D11;
	Fri, 25 Jun 2021 16:02:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDD2FB3
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 16:02:54 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id g21so6690985pfc.11
        for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 09:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vH9gGV+N9Li7jSn//rjoz4zxZgjc35zihgZyClp6d2c=;
        b=hJs2QLhZ2cMgs9FXPWLHr452pOlKNA2YDtjfE2/+4d0w9cisSuztJrof9o5lEI2984
         jMFIXpc4F1HQbxfendk0MUhKeCzWyMDHU8OaNNl5vvP8jIPqUDBczf8+YIQvYyRmpida
         rtRhaQocNdWcnk84K3Ek0Op8GhTHpBVkGtwy40SbuVZhtCbuvr00yWrdRH1xg2bFW/kO
         Lvfvtfjua741L0G0KAjQJm6SLT6iazPCBf7IRXvyOQ8IcTSiJS02H3xHM+4vOcfXGqoh
         OSUtHB9J4H25BnqInkgg9CIBe4gIFy2uV1rA1U1H7GlznuHE1Ctmc6oa8YNCnUZ76qzu
         BfDQ==
X-Gm-Message-State: AOAM532pXei/sJiQTPeWNzBtW3WGbMqlOqh+UT50tv+0VIFa5B4b6EMX
	ExkE3G1QK4B2k/NZWZWmXIY=
X-Google-Smtp-Source: ABdhPJypA/kPxJLrZVCAevvHNV13Xo/Cgy7hHodG8E/5G7sR/BJjnxbPF3iZt5NDDQ61bfUznR5t9A==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr10198237pgb.127.1624636973556;
        Fri, 25 Jun 2021 09:02:53 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id l24sm5856330pjg.53.2021.06.25.09.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 09:02:52 -0700 (PDT)
Subject: Re: [TECH TOPIC] Settling Copy Offload via NVMe SCC
To: Selva Jove <selvajove@gmail.com>, ksummit@lists.linux.dev
Cc: joshiiitr@gmail.com, nitheshshetty@gmail.com
References: <CAHqX9vZ_F4p0J_E3DZ4eoW0d3J2dZET5GEbM4Gr5wkUdRRPsAQ@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <effe01f3-ddf9-64f8-da96-61bb82bfabc9@acm.org>
Date: Fri, 25 Jun 2021 09:02:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHqX9vZ_F4p0J_E3DZ4eoW0d3J2dZET5GEbM4Gr5wkUdRRPsAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/25/21 7:47 AM, Selva Jove wrote:
> The de-facto way of copying data in I/O stack has been pulling it from
> one location followed by pushing to another. The farther the
> application, requiring copy, is from storage, the longer it takes for
> the trip to be over. With copy-offload the trips get shorter as the
> storage device presents an interface to do internal data-copying. This
> enables the host to optimise the pull-and-push method, freeing up the
> host CPU, RAM and the fabric elements.
> 
> The copy-offload interface has existed in SCSI storage for at least a
> decade through XCOPY but faced insurmountable challenges in getting
> into the Linux I/O stack. As for NVMe storage, copy-offload made its
> way into the main specification with a new Simple Copy Command(SCC)
> recently. This has stimulated a renewed interest and efforts towards
> copy-offload in the Linux community.
> 
> In this talk, we speak of the upstream efforts that we are doing around SCC -
> https://lore.kernel.org/linux-nvme/20210219124517.79359-1-selvakuma.s1@samsung.com/#r
> 
> We'd extensively cover the design-decisions and seek the feedback on
> the plumbing aspects such as -
> 
> 1. User-interface. Should it be a new ioctl/syscall, io_uring based
> opcode or must it fit into existing syscalls such as copy_file_range.
> 2. The transport mode between block-layer and NVMe. A chain of empty
> bios (like discard) vs bio with payload.
> 3. Must SCSI XCOPY compatibility be considered while we go about
> building interfaces around NVMe SCC?
> 4. Feasibility and challenges for in-kernel use cases, including the
> file-systems and device-mappers

This topic seems closely related to "Storage: Copy Offload"
(https://lore.kernel.org/linux-block/BYAPR04MB49652C4B75E38F3716F3C06386539@BYAPR04MB4965.namprd04.prod.outlook.com/).

Notes about implementing copy offloading are available at
https://github.com/bvanassche/linux-kernel-copy-offload.

Thanks,

Bart.

