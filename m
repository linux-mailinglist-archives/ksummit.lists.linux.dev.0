Return-Path: <ksummit+bounces-2734-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127FD07346
	for <lists@lfdr.de>; Fri, 09 Jan 2026 06:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B24843018942
	for <lists@lfdr.de>; Fri,  9 Jan 2026 05:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C03C260565;
	Fri,  9 Jan 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzC2qsQr"
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3E26F2BD
	for <ksummit@lists.linux.dev>; Fri,  9 Jan 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767936607; cv=none; b=cyfBIoUY+VMPdpC9XRi0ge6207aYF6CoN0k+S0CHswlxxYl0hhq2014A0e8JY5Tov/TINNU1YRka6BndXheL2YAu72lTWnZjcwQctYBUiZKtONBgxVz00FmYbRKQL/hUfB5JBGS8/GDgwwBPPS6k/bKIYvD9DatCFeJXLw5lDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767936607; c=relaxed/simple;
	bh=Mj47l2IWaLTs3NXZwkFO1trSpIzaJNyUM0yVwg7oMdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeLigkbaVXbOVLFBMGVcgHHcVFvOHmvBFOfcVNbSAFLxGAiv2+MiKIlcQPFYr+NJ1VILNAdCowW5K0MWIxv21YdvwSpdc+O3PCesCDXvCTt1xuV9zWG/TXyBEJ5PoCMOrkmUOIGu/Voxrnj721IMnwqEZN01E+uC8KBzFQGodDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzC2qsQr; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2092273f8f.3
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767936603; x=1768541403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlX/wTrZuwZGU18danwT6gBtV0nfe5EttE7RqttuQsY=;
        b=RzC2qsQrJh1dqJBTB36z+p8xqBn8Is6G727VQs/NNviybQa+7HKlHoz44eUlbkivel
         n0w1TAWBiRJfVRJ+sPOONJnALxu39y5JmMfjc7zPG9qX5EqqruiifVPTIbz7+o+T+jH0
         MoEIb8aXgG9bdLqfLcZLxDftfW3PpCaWjTOBckjIc53LKoibM4IAbQt7TtrboKbMFe1h
         LTYXVzYpJvrmzlYpUg58T3glePdRTN8YFXRwOzGHRTA30kK4cAH95TSqBCJomkN7ziVc
         Xm0Mhq6V1RFUxqgHIgElkzNsRRKm34DyLv/Qy274kloIlqTRJ05/cJ0lnF2aYaS+PcpF
         aUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767936603; x=1768541403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlX/wTrZuwZGU18danwT6gBtV0nfe5EttE7RqttuQsY=;
        b=ctnD4oGvn231RHpUSl8ppwxIKvKTi3kmeYTOjGyo3gnI5DgEJPvHdH5+J+Owxy40bw
         dl3zXNvvrI4wlx57puYew8KbNVdxcjNC04hF6XNvXJnVKRqK+oT4sm9L+r4APobYwvRm
         q4BSWkfqrtJ4Ld0RKbySZjOHBwyRSEMh6kzHpr0h243YE0sZro6cxbafna39GyMeiZCF
         jcp2N9xNh5ipYysqa/vk0W8KmoBYcWNgrUMKk3qBqvgDmTbYnkoN967pgAD3nOgGZlCT
         1Rdpf5WOLz8BSnn4+Aju3O21DBGmRvIPd4xd6SUPW0nZjCQoMWZU3KzY1Wbga0Efw5IQ
         mZQA==
X-Forwarded-Encrypted: i=1; AJvYcCVGa8KH3X3yF6H83mH9N8usdvJHzcz4sSxXcwTCUSm8cRERsRHBln/lCp4UVd22ss1JRBMmZiff@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpxq0s1zfyeVHDdgOE+en7I2IoRGEKkod624yeRMcoKfqjvu1O
	Y4ntSFbS9W1SeeDfA2+Jfy50IHkgVrW5Pz+tMccUDX6fqH5Qj4Nt/WCIxTa5H9A6GOk=
X-Gm-Gg: AY/fxX5WGKPdUfAC66oQdl6m+t9ThOlczH3KFERS9MG7NK/FmuH+ZrjidPz6G94ZX1L
	XQE52yag4Jqs+Hur7NSy6e+K2YyY29LcU3GPT4AiDodERxaLVmy5n+XzvYBUM3zafZNWpjOn0n2
	Pn2iLfa/RTk3i/VeUdrLBLGfk7p61qEMmofnfc2FckFnFS13n5fu+y0xoQM05ZnwZV2JFK2ubH9
	QVBHULCt34xNjdwOsohfKSn/2JjufpEklgOpfF8wXW/G10Mp5H09jY7MyHpC6ANbtsPJ2YQPK52
	gmbWmnKuW8Gjxzg7/s4cEqx8p5QqTonQUGkAqET5LX75xA3m27lktxatMmKgs8FCdHEsOc0ej6I
	dKoBDiwPfAUrOIbCDvpvk6sHHjtC3lwBVlQyOPEeoLnf4QiT8LOVwrptho90a3ClSbgwoLp7qrz
	li16X5wO282JeLCgoY
X-Google-Smtp-Source: AGHT+IHIW77tCUXow8tCSksG255U7b5IhL2YGp4Ww34P0AxeIqcK/+U1jAbAWDroMjoW0u39lfdU1g==
X-Received: by 2002:a05:6000:3104:b0:430:fdb8:850c with SMTP id ffacd0b85a97d-432c37c380cmr9852754f8f.61.1767936602927;
        Thu, 08 Jan 2026 21:30:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm20339833f8f.19.2026.01.08.21.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:30:02 -0800 (PST)
Date: Fri, 9 Jan 2026 08:29:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWCSVh6NocePMvp8@stanley.mountain>
References: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>

On Thu, Jan 08, 2026 at 04:04:39PM -0500, Liam R. Howlett wrote:
> * Jens Axboe <axboe@kernel.dk> [260108 15:54]:
> > On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
> > >> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
> > >>   - Ask the submitter to explain in more detail about the contribution
> > >>     so that the maintainer can feel comfortable that the submitter fully
> > >>     understands how the code works.
> > >> +
> > >> +Finally, always be prepared for tooling that produces incorrect or
> > >> +inappropriate content. Make sure you understand and to be able to
> > >> +defend everything you submit. If you are unable to do so, maintainers
> > >> +may choose to reject your series outright.
> > >>
> > > 
> > > I feel like this formulation waters it down so much as to lose the emphasis
> > > which was the entire point of it.
> > > 
> > > I'm also not sure why we're losing the scrutiny part?
> > > 
> > > Something like:
> > > 
> > > +If tools permit you to generate series entirely automatically, expect
> > > +additional scrutiny.
> > > +
> > > +As with the output of any tooling, the result maybe incorrect or
> > > +inappropriate, so you are expected to understand and to be able to defend
> > > +everything you submit. If you are unable to do so, maintainers may choose
> > > +to reject your series outright.
> > 
> > Eh, why not some variant of:
> > 
> > "If you are unable to do so, then don't submit the resulting changes."
> > 
> > Talking only for myself, I have ZERO interest in receiving code from
> > someone that doesn't even understand what it does. And it'd be better to
> > NOT waste my or anyone elses time if that's the level of the submission.
> 
> Yes, agreed.
> 

Yeah.  Me too.

> If I cannot understand it and the author is clueless about the patch,
> then I'm going to be way more grumpy than the wording of that statement.
> 
> I'd assume the submitter would just get the ai to answer it anyways
> since that's fitting with the level of the submission.

Yes.  That has happened to me.  I asked the submitter how do you know
this is true? And the v2 had a long AI generated explanation which quoted
a spec from an AI hallucination.

I like Dave's document but the first paragraph should be to not send AI
slop.

regards,
dan carpenter


