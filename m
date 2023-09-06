Return-Path: <ksummit+bounces-1077-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF8794634
	for <lists@lfdr.de>; Thu,  7 Sep 2023 00:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E482814CD
	for <lists@lfdr.de>; Wed,  6 Sep 2023 22:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7862011CBE;
	Wed,  6 Sep 2023 22:32:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921D29AB
	for <ksummit@lists.linux.dev>; Wed,  6 Sep 2023 22:32:31 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68bed2c786eso336052b3a.0
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694039551; x=1694644351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/k7hYeMZYA4xOeMZOOFc4OyLOk3B8IVSt9fjlT6iwA=;
        b=MpDk+p5/9znTNpdqZIZVM39kMLiPUxE0lN87t2v3WEc93AGfTdXr/AHJyTqR6oyShP
         FLkp9czU5cOfAF2ReziRgIPnwbJkNZO7VANbCPj0/YskXiQNB4n0XbZLGTWJIaarEyDx
         qL11NQTXiQhDynWajVnQrrqBz3I/xJc/5J52qihyX+denX+EPt5vBMIw9EsH5KIbtdH2
         L6ll9hDZSAeoXdRRo8BDhIYde+fO/gWFVAUxXNf33tMluWXDVFooXWBzDnfzYqOgzqc9
         opY63NWiFJDrXMcCBBvH0rggun8OKMn+030PmzFrP+13F3yeT4nnZAMk1r9Y7wBmOQoL
         OJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694039551; x=1694644351;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/k7hYeMZYA4xOeMZOOFc4OyLOk3B8IVSt9fjlT6iwA=;
        b=SyZTtdiyCGZazOsvpjdAQU3DI3kaZxW/PUUyuXasLK1Kg/EyTc/A763fNuxrzBXJAa
         EV2S8n29kuN5ci1icX00XxrdcRd+sF0vaRqoP6FceRTSUlu6fp5W+ONcQzYaM0Hx4ZKk
         ISFU2s7qjopGx+iO09vp7LJ+uO3AX4ceuwSALDBmce4W0ivn+apvwAYls540XmclENIC
         YQMtKFANJai1tviPsc73KTd4THEAhh4KQR7Ub727wfEV3kgxUQoJSyU/D/soTdo2hsOO
         vMnrE9SjALTRkAPqn0o1d0673XZcYpqRXONAQEHFTMfy3HYNBRyEBlwk/7JHHhoOk6io
         tojQ==
X-Gm-Message-State: AOJu0YwG1bwwB5MDSHPsni6/BJk6/iMTDnPO769xh1+jy9T7/ScWOOxO
	FW4BqXsXr4GrSLJklig3P2E=
X-Google-Smtp-Source: AGHT+IEppSgTf+7k+4PfOZ0zOr8Vp72urJPadBO5RQ3WAxTOZllIpNyAieAN3ADE8WlCGmG4WH2lOw==
X-Received: by 2002:a05:6a00:23cd:b0:68a:5395:7ab1 with SMTP id g13-20020a056a0023cd00b0068a53957ab1mr18961993pfc.11.1694039550556;
        Wed, 06 Sep 2023 15:32:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78c13000000b0068c023b6a80sm11657851pfd.148.2023.09.06.15.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 15:32:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
Date: Wed, 6 Sep 2023 15:32:28 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
In-Reply-To: <ZO9NK0FchtYjOuIH@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/23 07:07, Christoph Hellwig wrote:
> Hi all,
> 
> we have a lot of on-disk file system drivers in Linux, which I consider
> a good thing as it allows a lot of interoperability.  At the same time
> maintaining them is a burden, and there is a lot expectation on how
> they are maintained.
> 
> Part 1: untrusted file systems
> 
> There has been a lot of syzbot fuzzing using generated file system
> images, which I again consider a very good thing as syzbot is good
> a finding bugs.  Unfortunately it also finds a lot of bugs that no
> one is interested in fixing.   The reason for that is that file system
> maintainers only consider a tiny subset of the file system drivers,
> and for some of them a subset of the format options to be trusted vs
> untrusted input.  It thus is not just a waste of time for syzbot itself,
> but even more so for the maintainers to report fuzzing bugs in other
> implementations.
> 
> What can we do to only mark certain file systems (and format options)
> as trusted on untrusted input and remove a lot of the current tension
> and make everyone work more efficiently?  Note that this isn't even
> getting into really trusted on-disk formats, which is a security
> discussion on it's own, but just into formats where the maintainers
> are interested in dealing with fuzzed images.
> 
> Part 2: unmaintained file systems
> 
> A lot of our file system drivers are either de facto or formally
> unmaintained.  If we want to move the kernel forward by finishing
> API transitions (new mount API, buffer_head removal for the I/O path,
> ->writepage removal, etc) these file systems need to change as well
> and need some kind of testing.  The easiest way forward would be
> to remove everything that is not fully maintained, but that would
> remove a lot of useful features.
> 
> E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> It collects odd fixes because it is really useful for interoperating
> with MacOS and it would be a pity to remove it.  At the same time
> it is impossible to test changes to hfsplus sanely as there is no
> mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> one that was ported from the open source Darwin code drops, and
> I managed to get xfstests to run on hfsplus with them, but this
> old version doesn't compile on any modern Linux distribution and
> new versions of the code aren't trivially portable to Linux.
> 
> Do we have volunteers with old enough distros that we can list as
> testers for this code?  Do we have any other way to proceed?
> 
> If we don't, are we just going to untested API changes to these
> code bases, or keep the old APIs around forever?
> 

In this context, it might be worthwhile trying to determine if and when
to call a file system broken.

Case in point: After this e-mail, I tried playing with a few file systems.
The most interesting exercise was with ntfsv3.
Create it, mount it, copy a few files onto it, remove some of them, repeat.
A script doing that only takes a few seconds to corrupt the file system.
Trying to unmount it with the current upstream typically results in
a backtrace and/or crash.

Does that warrant marking it as BROKEN ? If not, what does ?

Guenter


