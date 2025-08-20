Return-Path: <ksummit+bounces-2169-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66940B2E7B1
	for <lists@lfdr.de>; Wed, 20 Aug 2025 23:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD035E5F7E
	for <lists@lfdr.de>; Wed, 20 Aug 2025 21:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEAD33471F;
	Wed, 20 Aug 2025 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlIjmrYN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6B33439B
	for <ksummit@lists.linux.dev>; Wed, 20 Aug 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726520; cv=none; b=KgVVmk0bbCVTq8afGwfnTVDjI/iNpifJkuev/DHGoFFVgQs+bOw5N7fkyOKUetJCpuBYGYNnXdAd9aANeX3iwzBO3CBMOOrbO+jMVESniqKbWBDTIvYZ/e9t+zjwAEQ9cu+GPBN9atrC1L5F/RA96jAy6vXKR5cuXL5nM0CzpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726520; c=relaxed/simple;
	bh=zT/7aJofutAjZ39e1ygsNStQG0Q6jO/2ktVkRMZaBDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vy3r2TqPzjKJMMmNr+iTezx65U/U6UZNhW8JDe1p09RfhkvVcfirpX/5nZHM/7n572EPmv+1BI/K31Cy5P7jH+XbAUcLWbAC3ddejrMeQitOWw6LQaultLpnxcIfWRExuTz7i10R7qxOlNn/FVLgUJ4x2gT7P34htRW0usfIwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlIjmrYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB65EC4CEED;
	Wed, 20 Aug 2025 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755726519;
	bh=zT/7aJofutAjZ39e1ygsNStQG0Q6jO/2ktVkRMZaBDM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hlIjmrYNEatNcT9tQvR1xNyYCZC9e+YxJWaph/YA/QG18QCcasaffwJ7r60wdybtx
	 Q1uTwpe5LDFZH0DjzkrC4dQC6AhytKfLtAVe4BqhsMvY6kpEcxzt4ZXMQJULMUOVd/
	 1fb6M0MM714Jl6mOIogfdq85/sSPCLDIu2LAldOJmCsgYW6jcQLOCFyyBAqqVRsXrn
	 kig2dmH9VC8uG8aSANwMcig2U5hUHs5EeFOnnEGMekeGDXMzlBx+/fvGJq44YyN2Vt
	 jqlvcDBjM2RtsiSQpxBdpadKRI1cauDuxexn5plZEmdMEXg7EsNMzwFY12MLNcJKHV
	 ra5mM/d9ByuDQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 52C13CE09F9; Wed, 20 Aug 2025 14:48:39 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:48:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <b11d461a-3844-49be-a664-e04dd5e57174@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <aJp7LbfETVBH5L0A@bombadil.infradead.org>
 <20250818234129.1e5e537b@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818234129.1e5e537b@foz.lan>

On Mon, Aug 18, 2025 at 11:41:29PM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 11 Aug 2025 16:22:21 -0700
> Luis Chamberlain <mcgrof@kernel.org> escreveu:
> 
> > On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> > > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:  
> > > > b) seems kind of too late  
> > > 
> > > Why?  
> > 
> > One cannot assume at this point AI generated code has not been merged
> > into any large scale open source project.
> > 
> > I am also not sure it can be stopped.
> 
> Agreed. The same applies to all other patches: nobody can really tell if
> some code could potentially contain code not developed by the submitter.
> 
> To be frank, considering that most companies nowadays have policies of
> not using public AI for private code, I suspect that AI generated code
> contains only public domain code or open source. As open source licenses
> explicitly allow one to learn from the written code, except if AI
> (and the developer using it) are just copying the code, it will very
> likely be at the already allowed open source license clauses.
> 
> Now, when someone from a company submits a patch for the company
> hardware, for instance, it is a lot harder for a maintainer to be
> sure that such submission was approved. The SoB is a sort of
> protection for us, as the submitter declared that he had the
> permissions.
> 
> So, at least from my side, provided that the patch is good(*), I'm not
> concerned if it used AI to help him or not.
> 
> (*) good patch means that, even if AI was used, a human adjusted
>     it to ensure its quality.

I am with you in theory on relying on the SoB, but in practice we have
not yet clearly stated what the SoB rules are with respect to AI output.
This is largely because the legal rules that we will need to align with
are still in the process of being established, and rather messily via
a large storm of legal actions.

Again, although I hope that it eventually proves to be safe to use AI
output in Linux-kernel patches, it would be foolish to count on this
at present.

							Thanx, Paul

