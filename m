Return-Path: <ksummit+bounces-662-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C98550AD6
	for <lists@lfdr.de>; Sun, 19 Jun 2022 15:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 03BF62E0A3C
	for <lists@lfdr.de>; Sun, 19 Jun 2022 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C560B647;
	Sun, 19 Jun 2022 13:19:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D67B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 13:19:40 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id a15so831973pfv.13
        for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lmpU8v7jLJ8Scn0rnepVThxFjpxjEs3SUsd3p1Tkrpw=;
        b=IJogi+juRg23AsHHdRSHgAESHFqgy+whlfyoLDwqyTVJ7Kqw9Er51XU+Z+is7UNvYN
         KsvneLituG912xQYveMMGfA4dRIpnw/Ybx5DAhPUODi38R0eUovIru6dKrAbL8WvtDJ6
         5xpub4JUsbaxphwxQ6cqACkR1z38L2QCnTDGJQC8ZN+IC1XdSZI4EtC1yGzhPZJr9AqG
         a+OymMGq7AXApG7C7kUDQbgr7mPKGf5liKhin8S/KUegrXx0xi0Xv+BSougObP/G7LQk
         aFVadLB9WESPCp1VEez46+IZqTBMKnAGVJ+QP6N9cNEcrWbUjaSTmer3IJfbR6ecoAEI
         yzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lmpU8v7jLJ8Scn0rnepVThxFjpxjEs3SUsd3p1Tkrpw=;
        b=nsKvWoLxH1OrBwE1dyEp4fZNBCfKgUcWu1RZAzGR2ZWLdb9cJG1SMkvH6RjbzKxQ/j
         TuwNJNzoP3CI2TXyoaKyywbfsAvkHzg+3QhcP4OR/fNDVA6klh9x5jAxkhOYYy0RJTZO
         fy+TtjJkTksF9PG74eQ3l3apekH76ycPktUNx0Yz9Y7cdd523fWHd/NhuMZwZGnS+INr
         pEUlhZNl43SR3AJ81gsaRnCoUZ3cZzIR9ZEAZxGdGN7hXgJj2sHIM3m5s1q8bSLrQziC
         IkDv/JtMnKM7DOf5lt8TIRDIuI9FA7/SxxMDNIP54nF3P0do2GqkKmNnc+NcWY2IVnLj
         M4gA==
X-Gm-Message-State: AJIora8ULD8TN0Pl2vXT2Gc7iDdQAQSNiQg8Lr4PKIW5ZmaCkeCDDysa
	U30KMj60GZytWatyrbQultx8Lw==
X-Google-Smtp-Source: AGRyM1vBgJRNkyEmklyjtroJI1OhSWMDcs+TeiQJDL9KHqhcpBg8J/Flt2k+SOBgB+0MdHcHwGXomw==
X-Received: by 2002:a63:a112:0:b0:40c:450e:b1ad with SMTP id b18-20020a63a112000000b0040c450eb1admr12796432pgf.493.1655644780266;
        Sun, 19 Jun 2022 06:19:40 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902a38200b00168f329b27dsm6781892pla.53.2022.06.19.06.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 06:19:39 -0700 (PDT)
Message-ID: <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
Date: Sun, 19 Jun 2022 07:19:38 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [TECH TOPIC] Rust
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/22 6:56 AM, James Bottomley wrote:
>> One point I'd like to explicitly address, as it seems to be very
>> relevant to me when it comes to whether or not the pain is worth the
>> gain, is how we'll deal with the fact that the rust compiler will
>> tell a non-negligible [*] part of the kernel developers that they
>> don't have the skills to write kernel code. Will we have a credible
>> option to offer there to help people improve their skills set, and
>> how will we deal with the fact that some people will be left on the
>> side of the road ? Or would we acknowledge what may be the elephant
>> in the room that this would actually be a good thing for the kernel
>> code quality ? What about the impact on a community that is already
>> overworked and prone to burn-out ?
>>
>> [*] I have no way to quantify this at the moment, maybe I'm overly
>> pessimistic, and the number will likely vary depending on areas,
>> probably impacting BSPs differently than mainline.
> 
> I don't think that's a huge concern.  After all rust isn't going to
> penetrate every subsystem all at once ... and realistically it will
> only penetrate some subsystems if there's the ability to review it.
> 
> I really doubt anyone at the maintainer or reviewer level of the kernel
> doesn't have the ability to learn rust (now whether they have the
> desire to is quite another matter) and I'd be surprised if we can find
> any kernel developer who only speaks C.  I think the biggest problem
> with rust is that there's definitely an anti-C bias in the language. 
> What I mean by that is if you look at Java they chose to be as close to
> C where possible to make the language easier to learn.  Rust seems to
> have taken the opposite view and picked a lot of things which could
> have been C like (typing, function calls, returns, mutability, etc.)
> and done them differently just because they wanted to be different from
> C.  That does cause issues for C people because you tend to trip over
> the anti-C biases in the language and are constantly having to look the
> basic syntax up.  This really increases the learning curve going from C
> to rust, which gets annoying very fast, but it's not insurmountable.
> 
> All that said, I expect once we start getting rust based patches, it
> will quickly become apparent where the rust receptive subsystems are
> and I would expect reviewers in those subsystems will quickly become
> rust fluent.  This doesn't answer the pain vs gain aspect, but I
> suspect we won't know that until we actually try.

FWIW, I agree with you here, James. And I have to say that the original
sentiment expressed here by Laurent is weirdly elitist, and not
something that seems positive if that's the case. I'd suggest
re-calibrating that mindset...

Some subsystem maintainers are pretty much spread as thinly as they can
be in terms of workloads, while other subsystems are less active and
supposedly have more spare cycles on their hands. Some handle multiple
subsystems, some subsystems are tiny, some are huge. All of this will
impact both the motivation abd ability to adopt rust.

-- 
Jens Axboe


