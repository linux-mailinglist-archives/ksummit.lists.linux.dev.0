Return-Path: <ksummit+bounces-2197-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C22FEB308A4
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6C5C624429
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A955D2E8DFF;
	Thu, 21 Aug 2025 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb79QlvF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF7393DC7
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755812942; cv=none; b=H7NSU/duQaqFv84QXUvSEpDQ0j2azHOW3+vifI4OFgz9sQCIYfkzuKaA0PqZ94lMCryL0A99oFmedvEFEFMJvPb2z7uPJiyZkQromPmEsJGX1PAcqs1UWRTsUC+ER/2legroSH7lrrXdSOeFHUVzJoX04kA4kAkuq7ciGTU30OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755812942; c=relaxed/simple;
	bh=cKMSsSGS+rQ7ZL6ZKJsWNyyA4ZDhHJqoGXSWZNBl+MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMeX96S3fjVxXA5WhLOQ+bwUZonu/hCT4GcSFqVTI8nQxo013zX9DXhY6CxBtlkyhUMLmIYthkkIf/zIVUBaoTEa+Jqyav2FNW9QzOYZHT5BONePFk8UOG2LEL1ozaKeRh5yxuucuLf4aHlFaz9l9APWopl4E03iQ/bdWrzqVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb79QlvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FBAC4CEEB;
	Thu, 21 Aug 2025 21:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755812941;
	bh=cKMSsSGS+rQ7ZL6ZKJsWNyyA4ZDhHJqoGXSWZNBl+MU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Fb79QlvFcoCVIg/0442U6OftLxV3pTdJQcecZ107R+zB9Gktc0YQ7hAkuVQ4RKYGK
	 ktZNDPu41ltBN38W5Ex+GVm4BU0sftRDIDr5vj1r0VZ3hWqhYoY1mgQbNG7ZhyHtng
	 eH3sDaT/hzfKNnwxdf24XO7LzECwCY/7JxJcuAUnjFaYiIOc+Hgb0DnZk2vdH4xu+8
	 8RW1pxdyfoUNwcS2XElTHkgfwmpzql/JWPvtQkDk6o/ESPtGolYgQmBOs2HOQBeRC5
	 ujfk0L04b8+HJhk5ZJcVlCNz8ZJqp7zXWMOG2XlbTne6Q5hdUtJq+bhbZ0AXGWlqTE
	 YLGq8rgJegEYg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 38D8FCE0854; Thu, 21 Aug 2025 14:49:01 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:49:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Luck, Tony" <tony.luck@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Kosina <jkosina@suse.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <38d56360-e3f9-45d5-88f3-b13a6d8286c4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
 <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan>
 <20250821125037.5cf5be3d@gandalf.local.home>
 <20250821193041.398ed30b@foz.lan>
 <DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
 <20250821200159.1bcdf0c9@foz.lan>
 <7c199d68-cf81-4507-b66d-d743bda34c81@paulmck-laptop>
 <20250821173207.0be7c530@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821173207.0be7c530@gandalf.local.home>

On Thu, Aug 21, 2025 at 05:32:07PM -0400, Steven Rostedt wrote:
> On Thu, 21 Aug 2025 14:21:13 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > Yet, as I saw a lot more the "Hello world", I haven't using the
> > > brown fox pattern for years.  
> > 
> > "Sphynx of black quartz: Judge my vow!"
> 
> I had to ask Gemini: "Make up a sentence with every English letter in it",
> and it gave me:
> 
>    Since "the quick brown fox jumps over the lazy dog" and "pack my box with
>    five dozen liquor jugs" are already well-known, here are a couple of
>    different sentences that contain every letter of the alphabet:
> 
>    "Jinxed wizards pluck ivy from the big quivering sphinx."
> 
>    "Sympathizing would vex a quick jab from the crazy fox."

E2BIG!  ;-) ;-) ;-)

							Thanx, Paul

