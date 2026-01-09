Return-Path: <ksummit+bounces-2735-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B714D073B9
	for <lists@lfdr.de>; Fri, 09 Jan 2026 06:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5582D30198E3
	for <lists@lfdr.de>; Fri,  9 Jan 2026 05:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E0D27281D;
	Fri,  9 Jan 2026 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csQA0fOq"
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFD260565
	for <ksummit@lists.linux.dev>; Fri,  9 Jan 2026 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767937383; cv=none; b=JANJWqT61VjhTJadmhP5yLQUuqux7IfCGtMBRp+socyXuUeasDdtzsinrgQSznW/anNZ0G4YfUDOcFC0ITwUKYgCPIvgOU5Cp78bSMMpt1vYyPB6AUY8ihlBwQdxR1C147uDPap2JsOgQYjRnc7C8vVDuJMDL7MMZGJEEN3XPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767937383; c=relaxed/simple;
	bh=lyOk/1M5pzUzuzEJIZ+qNtV8QTN4iICp9NKhm4PSg5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9Chhsub73DkPAhJ0ThxAFTEcSgCvS6d8ZMl0M0EjezAEuT5/j2NcWdQBCryuFpg+OmYibGb2DfuFr91G9oSoXCVU7TYn1whvvmutm+rxSw+fGfayyPW5avXOIvPZDIXS3dvT79kgqwPPnUBgJuTHLQX++jt8Djx0RvcyRuj1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=csQA0fOq; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2857420f8f.1
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 21:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767937381; x=1768542181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDsg1uOh4nHyxX9yWUni96h7XzFm6nGUN8LTejyh0mg=;
        b=csQA0fOqrTIv1YnTYVjuJcXQYKcXW3VYOTYYE2S/ud8GfqJ6Spl7JcxRN5YAhcohVy
         MJROKjMy2wyfT9J6RbucsVi2PqUSdDABTMrMQUMAJynC+V8WbYqwQvSJP8rJizQXH36f
         ffjyV16Qe/cx3ury2whpTRY8HwXsGNTpu+NekdBqjX8SoG4QKQZELpF8yfcNnrdMptQ2
         IM2He/3Jp/tgXBkiCaJddF7ar7WwjnQOUXsY08jurR7klXrdGYsI4T+kX9QhQFbd4wCf
         d4jWSHjkP2C0dCmb+RsDKUfHxaPsj+IVnxMu2kB0+7aM+EMsKiXfM4kuJpAQgpip4Fm8
         pgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767937381; x=1768542181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDsg1uOh4nHyxX9yWUni96h7XzFm6nGUN8LTejyh0mg=;
        b=n5kIlgddIAXtTJVDvvLZ8yAdqzx0uJjn/1GjnZsE7v1s87uCSxVsrO0A/Ljkds8wdK
         /2MpvFkaHNjSI2ThAcMayZNvu3lPj4OGIy87iMai/bP94oEBMHktgnfx4C09p0wGCgHJ
         DUJYzrEnw3LwCeg4iF3WZCxHvNWUHDm8SgZAaPdo6Pyj8qsop5m6mCxjFJ/PGYlSEiO0
         2OEbz8GS8GGfEkbVVv0dZQsuwu649UKyLSlQa1vUVimfeqeEPTwqze3FX0wLyyMSTAOb
         ivuszZkc1Pv8Nv+b0VcpbYJ/DmzX1qQb1OVNsNodh8Vh/UGuqRhitS81NCdpHULI0NRP
         GVOg==
X-Forwarded-Encrypted: i=1; AJvYcCXYbu2GFd09vtYKuXn7/sZJhq1fdw0DL7OJROHNm4v/TLlXgL4TGhnKe0lmfOd7Z3BgDSP3x/aW@lists.linux.dev
X-Gm-Message-State: AOJu0YxxA1NhUxzIGQ28dyaVtKjEENxoLvOglRbCqYj04ZiJS6ZFPm3W
	NzaRLKU25gBhS35ZQD4KdSX1eVTt/IZ9VwEL6OdJbqCDg/7wCe6rfEn7MeQXTXOZEiA=
X-Gm-Gg: AY/fxX5ci7ka8yegxhosB7oTc4JSWIfCrFresKicYN075GKE4YClq8Zg4qqaIOGSPbL
	iR0PAFjjuxzLCQHZU35SbUXA4eSXWpvq3ny6JVQAsdk62slJe7SU9eOAyEBdIIP9MT87t+F2sdH
	I8I2iBtUj5YOUcuGVTwRDxNTdpjwE92/jZtyrNPcVJ2qR6PJs57uLLCFpKNLZwOp17MTYK74Keb
	sg2hwWXi7cpRRxiYfwgHBkVMxxTdhX3/tdPmLcKPcGYhsON8ikQpX+1MRmnx5hNGPlqkutVhwza
	4vfs2Ny/xnKIJOKBQNwgTeiGUTzFKP/92fXvEWnplrcX5JDsQaECDlttl0qOLzq2YvHuc1wLQ2p
	16srqLEP4WS7ulzUjMGmRXvimVbBIW8LJYT+8kYKsL9iORvK6U78RxGukLHpTGJe8EzAtKUyyY2
	X+sjhhmO6xSMhnn4og
X-Google-Smtp-Source: AGHT+IFtRqdtvSZtFdYNMvAAEbXBJ9dvS7lUHvIH+DVKEKI5EhL27ZqtmfMN3VJprnKU2dkiBMjC9g==
X-Received: by 2002:a5d:5d05:0:b0:430:8583:d19e with SMTP id ffacd0b85a97d-432c374f4f4mr7932200f8f.8.1767937380338;
        Thu, 08 Jan 2026 21:43:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm20503335f8f.43.2026.01.08.21.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:42:59 -0800 (PST)
Date: Fri, 9 Jan 2026 08:42:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave@sr71.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWCVYLuUFZrsbfd-@stanley.mountain>
References: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108151437.3188cd53@gandalf.local.home>

On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> On Thu, 8 Jan 2026 11:50:29 -0800
> Dave Hansen <dave@sr71.net> wrote:
> 
> > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > I'm also not sure why we're losing the scrutiny part?
> > > 
> > > Something like:
> > > 
> > > +If tools permit you to generate series entirely automatically, expect
> > > +additional scrutiny.  
> > 
> > The reason I resisted integrating this is it tries to draw too specific
> > a line in the sand. Someone could rightfully read that and say they
> > don't expect additional scrutiny because the entire series was not
> > automatically generated.
> > 
> > What I want to say is: the more automation your tool provides, the more
> > scrutiny you get. Maybe:
> > 
> > 	Expect increasing amounts of maintainer scrutiny on
> > 	contributions that were increasingly generated by tooling.
> 
> Honestly that just sounds "grumpy" to me ;-)
> 
> How about something like:
> 
> 	All tooling is prone to make mistakes that differ from mistakes
> 	generated by humans. A maintainer may push back harder on
> 	submissions that were entirely or partially generated by tooling
> 	and expect the submitter to demonstrate that even the generated
> 	code was verified to be accurate.
> 
> -- Steve

It's better to have a grumpy document, instead of grumpy emails.  We
need it to sound grumpy and it needs to be the first paragraph.

AI Slop:  AI can generate a ton of patches automatically which creates a
burden on the upstream maintainers.  The maintainers need to review
every line of every patch and they expect the submitters to demonstrate
that even the generated code was verified to be accurate.  If you are
unsure of whether a patch is appropriate then do not send it.  NO AI
SLOP!

Of course, sensible people don't need to be told this stuff, but there
are well intentioned people who need it explained.

regards,
dan carpenter


