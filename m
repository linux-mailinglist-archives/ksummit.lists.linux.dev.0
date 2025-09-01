Return-Path: <ksummit+bounces-2253-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEDB3EDF2
	for <lists@lfdr.de>; Mon,  1 Sep 2025 20:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B9C482977
	for <lists@lfdr.de>; Mon,  1 Sep 2025 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94332A80B;
	Mon,  1 Sep 2025 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLEwPvEg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AAF324B28;
	Mon,  1 Sep 2025 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751878; cv=none; b=fuwLa3xxYJDPgs3lsvt9iXl2Zvo/A7+3mH/pd6QO13VJdI9u5nKjN9UkO3F92W+9JHB3ynlYvpcstAhjDUMmAzfh4iqA1zOsbWetQxur2+nVlpPCFLPxpSDJ/tE60Flh5jKqixBkGGcTdxRcRAzsldOB2XvmS8IQtT6VWYpPrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751878; c=relaxed/simple;
	bh=lWChbtV0eO1/Vu/kFAMK+CNnfHM3ltiDFDCc7jkAi4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MATzyJkwQ/QNzbUp4HgLzToROlD/voJZLEZNzIucmyfu23mIFuxM2CRSno0Xcv7jEwADeUNPObDZTju3sFpOxFcYjV8rDRD1zaBG7uk9F0NcsOUBsQjR5SQqX2I7uNr6z2kMGUfQti+4vkRBQcrXYWD5HFA7Nbp8g0GcITvJKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLEwPvEg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83266C4CEF0;
	Mon,  1 Sep 2025 18:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756751877;
	bh=lWChbtV0eO1/Vu/kFAMK+CNnfHM3ltiDFDCc7jkAi4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GLEwPvEgXExm/uNl4V9m1xNI0WbFOtuRY66ZooTYxfM7XXAecb+IAcKzIpB8Vr+jP
	 J1nvNbbnMmkyt/VSXTE0qDTbNdVFH6TIfxaK1qluewjADw5TiXu/kyCjPpvgsi5VDu
	 uTXADN1aRkNiLVi6aS7tqXYaL9YkcL9eWb0la2+oSZcDYYg2SDM+YRmcvlBP/4QJ/W
	 dmKDKphkKsSPqgU7/oPlgwSttbF44KzWhnuZesWHwdy0enc0c3mD41guLUZ0kD1tmn
	 mFLlDUZzUjHExLqmyf6PrDWZPdrqp9muq88quV6TSpFgIUCcSayytubaFlkugsMnAo
	 xqAh9F6pIm3VA==
Date: Mon, 1 Sep 2025 20:37:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250901203750.33ee6689@foz.lan>
In-Reply-To: <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
References: <87plcndkzs.fsf@trenco.lwn.net>
	<20250828230104.GB26612@pendragon.ideasonboard.com>
	<87wm6l0w2y.fsf@trenco.lwn.net>
	<930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
	<20250830222351.GA1705@pendragon.ideasonboard.com>
	<87h5xo1k6y.fsf@trenco.lwn.net>
	<20250831160339.2c45506c@foz.lan>
	<b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
	<b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 1 Sep 2025 09:51:01 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 9/1/25 3:09 AM, Jani Nikula wrote:
> > On Sun, 31 Aug 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> >> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
> >> kernel-doc now can parse the entire tree with:
> >>
> >> 	$ scripts/kernel-doc .
> >>
> >> Someone can easily use it to discover the current gaps at the docs that
> >> have already some kernel-doc markups and identify what of them aren't
> >> yet placed under Documentation/ ".. kernel-doc::" markups.
> >>
> >> So, I'd say the first step here would be to ensure that 100% of the
> >> docs are there somewhere. Alternatively, we could place all the rest
> >> of functions with kernel-doc markups outside Documentation inside an
> >> "others/" book - or even "<subsystem>/others/", and then gradually move
> >> them to the right places.  
> > 
> > I don't agree that all the kernel-docs need to be in the html build in
> > the first place. Some of them would be better off with a simple
> > non-structured comment instead. For example, most static functions. Some
> > of the kernel-docs are useful for the structure the format provides, but
> > still having them in the html build is overkill. For example, many
> > complex but driver specific functions.  
> 
> 
> IMO there are far too many static functions that use kernel-doc notation.
> I certainly don't want to discourage function documentation, but I don't
> think there was any ever intent to have those functions added to the
> kernel docbooks.

Sure, but on the other hand, lots of those have warnings. Even if
not part of htmldocs, IMO the kernel-doc markups should reflect the
actual code.

> > I think the API documentation in the Sphinx build is primarily useful
> > for kernel generic and subsystem APIs, or overviews of
> > functionality. But nobody's looking at the Sphinx build for highly
> > specific and isolated documentation for individual structures or
> > functions.
> > 
> > I'd say emphasize quality over quantity in the Sphinx build. An
> > overwhelming amount of (in the big picture) insignificant API
> > documentation does not make for good documentation.
> > 
> > That said, there *are* a lot of kernel-doc comments that absolutely
> > should be pulled into the Sphinx build. But don't be indiscriminate
> > about it.
> > 
> > ---
> > 
> > I think a more interesting first step would be ensuring all the
> > kernel-docs we do have are free of kernel-doc and rst warnings. Because
> > they should be, and this would make them easier to pull into the Sphinx
> > build as needed.  
> 
> ISTM that there are lots of non-docs developers who either just don't care
> about that or never run 'make W=1 htmldocs' to see the problems in their
> drivers or subsystems. OK, maybe it's just a very low priority for them.
> 
> Willy had a suggestion that we just make checking kernel-doc during
> all .c builds a permanent feature instead of a W=1 option.
> This helps, but still doesn't force 'make htmldocs' to be run.

We can run it without actually building htmldocs. The only requirement
is to have Python 3.6 or above (this is enough to get error reports,
but 3.7 is needed to avoid having struct/function parameters out of
order).

The real problem is that, when we start doing it, Kernel build will 
have thousands of warnings. 

Perhaps one solution would be to have an image of our current
problems on a file, reporting only new stuff by default and using
WERROR policy, causing build to fail on new warnings.

This would at least avoid the problem to increase.

> And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
> build.

It is a lot more if you check warnings for files with kernel-doc outside 
the htmldocs build and if you enable all kdoc warnings:

	$ time ./scripts/kernel-doc -Wall . --none 2>warnings

	real    0m33,063s
	user    0m31,233s
	sys     0m0,753s

	$ grep Warning warnings|wc -l
	36965

almost 37K warnings.


Thanks,
Mauro

