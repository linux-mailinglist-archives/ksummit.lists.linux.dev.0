Return-Path: <ksummit+bounces-2740-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B3D08CC8
	for <lists@lfdr.de>; Fri, 09 Jan 2026 12:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3874D30A50DC
	for <lists@lfdr.de>; Fri,  9 Jan 2026 11:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE75B2DF6F4;
	Fri,  9 Jan 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esmzqy+R"
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E733BBBA
	for <ksummit@lists.linux.dev>; Fri,  9 Jan 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956451; cv=none; b=E8NW5PD6gRaSOAvk8XCk+sgAt/yYy3QSYsNfmoi/589gcHK5Vby5I9xEdTG5vyV1koN165FxCwLRSAeaSQwPrJ3+NeerOaoZ06midfOK2xdwIj4iXB3y7uq0syg0FAKKsJ5gWbKLDhag37JWFN/P2bMrVb1CFrTKFXr0o0OvA3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956451; c=relaxed/simple;
	bh=hZXJGPMssGAfFbu+bAlt6gHtJ32mOvpL6uEOa1ztUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyjlmJ63a5YqGg9mq5ZgIgcYayO111OZVoznSjfPr0UM1AemABpKC7uEC0duHr8qTZ+C/Z4olWJpOZemUguoJ+PM7FQnkmMp4R88cpJKB8IQ8aXNrFP+ClJ8MRTckrwHOcBCjwWfCwDREpwih+mMtf2SsnmhjJAsBA8EH1JFU2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esmzqy+R; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59b685d2b79so3982656e87.3
        for <ksummit@lists.linux.dev>; Fri, 09 Jan 2026 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767956444; x=1768561244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCAkSgcFGLWAnWdp4SQJtJGZ2mOqXTVgkdEMSVyfWUo=;
        b=esmzqy+RjBNBaE0b+rhCn+Gjg/Lz8feaGhuRIyocL4tLTrvThqkChA3hSdZMbwC+mC
         iRsRyw8rXLO0lpE3IIBgRZjGGdPIl7AW6TLBoZ1Xgtw81yoF1D8QqEcpn+lKXKq6Bup+
         qwPZsAsroPIgDptbNk0GeRlng8uXzD119cifkAnull3w2wrzmCXbzQJi0L6d0osNCMpQ
         M4eaqZTzF1y9/rLgpoQ4Mlw89HO4aAVfRRPkAP9Zvmsscu18rQQPZzT88JPoepnsNTN0
         5OaLIcp0QPNCHuYL7vIRpPojtsICbWJXFm8pQErkK+Zc97yzHTeSr81XJe0B9NJgfzx3
         thSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956444; x=1768561244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCAkSgcFGLWAnWdp4SQJtJGZ2mOqXTVgkdEMSVyfWUo=;
        b=NNx3BB5wMQRcy6CmLxWuQBZO28FMVx0Xqci81o3/bteo545MIcvh3cI4jAMq6d2V7o
         swU03fVZImuuNT7Z14U7TZF0T2NyBagKhTXSjRHQqLg25IIygP8+buGxP9/RQWyEsLli
         OYRRbY3UxdZOX/Ilzqagxj8d+hBPMIz3tHuL1A+DYeRBCIVeQ8kKAk+U68YHbpPFUmKU
         /Z6WViyTu9S4VqSqqOMOA+Wo9Qy/51BeyLzlYkZFvPTzOiENADS0zQc75DRt1bFVrjTA
         Xck+OFB6myQ0lOcRSDlrch1xOKG0QD8BooRISwlHVwkCOXAGj9wpzvjhd5BsN9V7L7Tt
         cwpA==
X-Forwarded-Encrypted: i=1; AJvYcCXcrRVd4/ANPZgMXHg7LQovNiskDJ66NktBnpHrHGcb6bzOdwW3rGVwQg2QCqrRmphZPhZ/FkHx@lists.linux.dev
X-Gm-Message-State: AOJu0YxSTV8232x3JHBhRmKpd/FbxffMWXY9tRZFQAssNoPIPJwc2UHI
	EUHqRhkVE8/AkTdpBP8s0U9oN+Bmf2NXpKlPef9qf3LQwxUPWmH099H1Yl55v0LJC4o=
X-Gm-Gg: AY/fxX6g3Fxm0u56Cmyuvf00qcD1dScVQU72DGF5CkP4x9Uy7zBBwOZ1FFP8XM09Osx
	N2JA67zqxWYRbRmtklEPlXeRsfGPgoqGw6LgDu51XEjIcBgRfgFrSulspm8xJH+CEBmUgszHGOX
	busySxgKPM07KxOlgazavv7EqwG3PyU1BX7i6X5SEuBS2wiEfQeXcCSJkOpisw/2k04UI+4kkzq
	J2tWCWCfToEJYRinSG+dO4DwlF5tevgA+UdhxE7q/IYh0gi1i/EPnzCq0W9sI2gq2Q9sNUkK5zN
	u//Dg0n9w/pHLQmIlLDRMH2A2fd2jLifDUoPJD/n/w7gQ9m0Eu4snWWkdBWrgP/5CyqLGdx6cLO
	ivgrcl1lhKJBSe8DkugadQWbiuM+WU84V46Hx7lix1KRATF/b+uhCbQJubWlYfG5bWUbxeJ0Qtv
	iCmKsHjeEQyfAJ1rgB
X-Google-Smtp-Source: AGHT+IGXxI7r72eOkIy1KhlxJm58/JxPLQ5FF6CoxfgXHR2DOpaiFz27HbBI+CxtT+yMU4/t1/5Biw==
X-Received: by 2002:ac2:4e04:0:b0:598:de38:9150 with SMTP id 2adb3069b0e04-59b6ebe3029mr3229097e87.0.1767956443522;
        Fri, 09 Jan 2026 03:00:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b728badebsm1800519e87.67.2026.01.09.03.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:00:43 -0800 (PST)
Date: Fri, 9 Jan 2026 14:00:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWDf1zlLTKmw9xnq@stanley.mountain>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>

On Fri, Jan 09, 2026 at 07:48:35AM +0000, Lorenzo Stoakes wrote:
> +cc Jens as reference him
> 
> On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> > On Thu, 8 Jan 2026 11:50:29 -0800
> > Dave Hansen <dave@sr71.net> wrote:
> >
> > > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > > I'm also not sure why we're losing the scrutiny part?
> > > >
> > > > Something like:
> > > >
> > > > +If tools permit you to generate series entirely automatically, expect
> > > > +additional scrutiny.
> > >
> > > The reason I resisted integrating this is it tries to draw too specific
> > > a line in the sand. Someone could rightfully read that and say they
> > > don't expect additional scrutiny because the entire series was not
> > > automatically generated.
> 
> I mean you are making an absolutely valid point, I'd say that'd be a rather
> silly conclusion to take, but we have to be wary of 'lawyering' the doc
> here.
> 
> > >
> > > What I want to say is: the more automation your tool provides, the more
> > > scrutiny you get. Maybe:
> > >
> > > 	Expect increasing amounts of maintainer scrutiny on
> > > 	contributions that were increasingly generated by tooling.
> >
> > Honestly that just sounds "grumpy" to me ;-)
> >
> > How about something like:
> >
> > 	All tooling is prone to make mistakes that differ from mistakes
> > 	generated by humans. A maintainer may push back harder on
> > 	submissions that were entirely or partially generated by tooling
> > 	and expect the submitter to demonstrate that even the generated
> > 	code was verified to be accurate.
> >
> > -- Steve
> 
> I don't really read that as grumpy, I understand wanting to be agreeable
> but sometimes it's appropriate to be emphatic, which is the entire purpose
> of this amendment.
> 
> Taking into account Jens's input too:
> 
> +If tools permit you to generate series automatically, expect
> +additional scrutiny in proportion to how much of it was generated.
> +
> +As with the output of any tooling, the result maybe incorrect or
> +inappropriate, so you are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, then don't submit the
> +resulting changes.
> +
> +If you do so anyway, maintainers are entitled to reject your series without
> +detailed review.

This is too subtle.  In real life if we suspect a patchset is AI Slop,
then we're going to reject the whole thing immediately.  No one is
going to review all fifteen patches one by one as if we're searching
through monkey poo for edible grains of corn.

The AI slop patches I've seen were not bad actors.  Someone saw a
TODO in the file and thought that AI could solve it.  The patch
compiled, it was formatted correctly and the commit message sounded
confident so they sent it.

To me the audience for this is maybe a team working on AI and they
don't have any kernel developers on staff so they assume they're being
helpful sending unreviewed patches.  The message should be that every
patch needs to be reviewed carefully before it is sent upstream.  I've
been asked to review patches like this in the past.  Get outside help
if you need to, but every patch needs to be reviewed.

regards,
dan carpenter

