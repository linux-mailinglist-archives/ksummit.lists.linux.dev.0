Return-Path: <ksummit+bounces-2252-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A74B3EDD1
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2C45177D5B
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3341F32A817;
	Mon,  1 Sep 2025 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQn4N16D"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DFE32A812;
	Mon,  1 Sep 2025 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751204; cv=none; b=aFiO+6Cz/Fec8E8smyRtUVeMPN5oAGx6WOOfUa71UWveHAcWxm58eHDX1MigXp8iDiSkikfdm1vFItOf6MQkntBnUt9ELeR0aoIlv2gAh7GtmfDPHiJEmDCrK4kMCVCJN3eBIiJg0kyonrQOXXYoMFuGlEyDkGJ1gxdZlGYzzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751204; c=relaxed/simple;
	bh=9Ptot1U3GDfxEFDfnmS8j/dGCZE5HglyfHPfz83Uomk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvOAOY5aJNs1LhbWARjjk5q5EJyJp34ZJFcwFeeazp7pfRg6SZxzHBOAOxi/qSj5doVzE6rJe+mOnTIJWF5yKki2NC6vl8WhEx4B1cWfMHCg0RMIrGXvlv/4I/0xF6BxFQ0gKXQoFDGxxphI639D/OqkGzyK1/9Y4nRbQLfp5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQn4N16D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4226CC4CEF1;
	Mon,  1 Sep 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756751204;
	bh=9Ptot1U3GDfxEFDfnmS8j/dGCZE5HglyfHPfz83Uomk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TQn4N16D2vAQ5MlaTStCSwSJM+xYFJFvOb537+su4axquiarGMt6m0wBpLlRPGSYH
	 rQa47UVUommOZeSTFGnk8fivF62e7gck/oUPkLBMQ2K4VyVhnoQqenAnDN8xL2YOOH
	 e/kkH3oRoA+pWH6R2IeRs+3FKfQBY2bSqQUFGR+T8OBw8OZS4pANi8tZ68FGSPX3mP
	 78gox6sl6bbixJ17x+zl/oayYZpHAs1K4kU7WQio2o8uCYK3yJkpnTLowrSnFOWQFM
	 vISjTbFggQcmwfhzgQwF1QadxiepTTQRGXMkMGMGsKGUzKNPxsNNl9ImGYSARhi1p8
	 5Uv2DC2D3rTnA==
Date: Mon, 1 Sep 2025 20:26:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250901202635.426d099a@foz.lan>
In-Reply-To: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 01 Sep 2025 13:09:15 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Sun, 31 Aug 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
> > kernel-doc now can parse the entire tree with:
> >
> > 	$ scripts/kernel-doc .
> >
> > Someone can easily use it to discover the current gaps at the docs that
> > have already some kernel-doc markups and identify what of them aren't
> > yet placed under Documentation/ ".. kernel-doc::" markups.
> >
> > So, I'd say the first step here would be to ensure that 100% of the
> > docs are there somewhere. Alternatively, we could place all the rest
> > of functions with kernel-doc markups outside Documentation inside an
> > "others/" book - or even "<subsystem>/others/", and then gradually move
> > them to the right places.  
> 
> I don't agree that all the kernel-docs need to be in the html build in
> the first place.

Not all, but those that are part of the kAPI requires good documentation.

> Some of them would be better off with a simple
> non-structured comment instead. For example, most static functions. Some
> of the kernel-docs are useful for the structure the format provides, but
> still having them in the html build is overkill. For example, many
> complex but driver specific functions.

Driver-specific functions could remain out of doc build - or be part
of the documentation. It should be a decision of the driver authors,
that may or may not be expecting contributions from the community.

> I think the API documentation in the Sphinx build is primarily useful
> for kernel generic and subsystem APIs, or overviews of
> functionality. But nobody's looking at the Sphinx build for highly
> specific and isolated documentation for individual structures or
> functions.
> 
> I'd say emphasize quality over quantity in the Sphinx build. An
> overwhelming amount of (in the big picture) insignificant API
> documentation does not make for good documentation.
> 
> That said, there *are* a lot of kernel-doc comments that absolutely
> should be pulled into the Sphinx build. But don't be indiscriminate
> about it.

Agreed. What I said is that this is a good start point, as it sounds
to me that we do have kAPI documentation inside headers but not
exported to the documentation.

> ---
> 
> I think a more interesting first step would be ensuring all the
> kernel-docs we do have are free of kernel-doc and rst warnings. 

Agreed. Things look better those days, but just because right now
there are several warnings disabled by default.

> Because they should be, and this would make them easier to pull into 
> the Sphinx build as needed.
> 
> Currently we only have the kernel-doc checks in W=1 builds for .c
> files.
> 
> The i915 and xe drivers have local Makefile hacks to do it for more than
> just W=1 builds and also headers. The attempts to expand the header
> checks to the drm subsystem, however, failed infamously.

On media, our CI builds with W=1, and aim to have no warnings.

> And still none of this checks for rst. But now that kernel-doc is
> python, it shouldn't be too hard. Probably needs a dependency, but it
> could only depend on it when passing some --lint-rst option.

Good idea. If you have some time, feel free to propose some patches.

> Having this in place would also reduce the churn caused by merging
> broken kernel-doc. It's fast enough to be done as part of the regular
> build, while most people don't run the entire Sphinx build as part of
> the development flow.

Checking the entire set of files inside the Kernel with kernel-doc
is fast. Using the new make mandocs, for instance, with reads the
entire tree takes about 45 seconds on my machine:

	$ time make mandocs
	...
	real    0m44,211s
	user    0m35,787s
	sys     0m3,274s

(and reports thousands of warnings)

Thanks,
Mauro

