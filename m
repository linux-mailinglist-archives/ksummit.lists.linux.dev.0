Return-Path: <ksummit+bounces-2255-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC988B3EE14
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F70B1B20B8B
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C2B1C6FE5;
	Mon,  1 Sep 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsMtq9S/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8974469D;
	Mon,  1 Sep 2025 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756752400; cv=none; b=PsLPS5amI5IflxFO5STGkMi1+tXszqFq9n7uIbRFh3XDd/0bi5qI95PxmC1e2Thg7wsLVp+TLxqa4l+oU8EJKD9ui0rSu0LbPG/VMIQHXQESQmRcbn1ZOc8aH3tCsiBSlLKDrxjs467az2zNENZZvnqFWeh83bMUnKuXV+p+xVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756752400; c=relaxed/simple;
	bh=Ow1baPkcuO+bbWFO5G03edjfhcs1V7ZOVzUmLyKNaUw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uf2xKMnWRZ9K9l2/AMeF17aeRCoYqUStKXLsed5F8CXlVOC6p/KUxK/VBwp9XpsWpM3nUiPysyruC3oGE+36z22ujymWBdnJqb/Bdr5mXRGC08QYeuzg7dneiT0cjsK7k3wbLV1gPkbcak8toNIdgy/NZDu76vihVZ9IzQK+5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsMtq9S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5376C4CEF0;
	Mon,  1 Sep 2025 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752400;
	bh=Ow1baPkcuO+bbWFO5G03edjfhcs1V7ZOVzUmLyKNaUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lsMtq9S/CXK4yrxEkf7z7Fe5KAi/8EEmJnniexc2VqdPmYI8/FHFYGuAprBAcYg+4
	 +FLYrOHoiuDxoTEvGfLn6xx5+pQBw2XpiI5QOk3zLvbeSIpKoGte0tZpXzcI/U99ij
	 HNfzEydsCTwf7HfELupKvK2veAQHAJv/jvMgyZvEafxcUcOoKa+kOpGiHx259Calxq
	 feHrBa2XX46cFvi+s9yFs6bZdXMGn3+q/OOj2Quo9EBAaSnJX3O44VCZbVUdh9YdvC
	 Om+ZOGe38eiCqHO7kis0yr0KgHs786u7jYpWEt13qSqr16DR2dw4TyXEegrGqb1SAn
	 AJ3sI4QlRyozQ==
Date: Mon, 1 Sep 2025 20:46:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250901204635.51b81ffd@foz.lan>
In-Reply-To: <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
	<2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 1 Sep 2025 18:52:30 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Mon, Sep 01, 2025 at 09:51:01AM -0700, Randy Dunlap wrote:
> 
> > Willy had a suggestion that we just make checking kernel-doc during
> > all .c builds a permanent feature instead of a W=1 option.
> > This helps, but still doesn't force 'make htmldocs' to be run.  
> 
> make htmldocs is rather slow:
> 
>   $ time make -j56 htmldocs
>   ...
>   make -j56 htmldocs  2355.99s user 141.33s system 158% cpu 26:14.86 total

Sphinx itself is not too fast, but we don't need to generate
htmldocs to get kernel-doc results.

On a Razen 9 7900, kernel-doc takes about 32 seconds.

It should be noticed that kernel-doc doesn't run in parallel. Python
still suffers for a global big lock (called GIL). My attempts to run in
parallel actually made kernel-doc slower, but this is changing: the
next Python version is planning to get rid of GIL. So, maybe within
a year we can re-add the patches to run it in parallel.

> and produces a bunch of warnings with current mainline it seems. 

True.

> That
> compares unfavourably with allmodconfig on this system:
> 
>   $ time make -j56 allmodconfig
>   ...
>   make -j56 allmodconfig  5.31s user 1.93s system 146% cpu 4.931 total
>   $ time make -j56
>   ...
>   make -j56  53468.11s user 4387.30s system 5084% cpu 18:57.77 total
> 
> and seems rather more likely to flag something for me.

32 seconds more, on the top of 53468.11s doesn't sound that much.


Thanks,
Mauro

