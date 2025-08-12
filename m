Return-Path: <ksummit+bounces-2149-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDDB22F92
	for <lists@lfdr.de>; Tue, 12 Aug 2025 19:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71EE618845B0
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392B32FE56A;
	Tue, 12 Aug 2025 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESjl35Fq"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CF2FDC3E
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020349; cv=none; b=GOdlXRhim6XOa60CYyk8579aiEcs7OofRwiOyqvnfucY1uWoEI1rHL7CdPwufFx2YTso4Yu1vlM1Op3rLAuydHmuiwW/uMsivvQngL/5s44nmAliCLSAUIWSS98yhVwUN1nmHyPem0I/mvHj/ptprs/SBrj1GdzAASkHR9Vk3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020349; c=relaxed/simple;
	bh=OQgPhnqQ3ZuAUOskFVBbBwZkhISGLd6bAxKjBdmlb8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7XxrOzclQTv6yQ8fGrX/tnqSbADidyqGZChbWyxprqZxG2tkCMWnHq146gBOo/CgjQi0Hvgc/gQsYYZpq1RgBiIk6Q8AyqX1Tx7jAaoSMZgdUBDrtysH+GijqoqJc7ocdIrBCyNfiNSZT2K4gS5C4cQbPpBHqI4cVWd8AEn7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESjl35Fq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAEAC4CEF0;
	Tue, 12 Aug 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755020349;
	bh=OQgPhnqQ3ZuAUOskFVBbBwZkhISGLd6bAxKjBdmlb8A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ESjl35FqjPjueRmDG+cSxuDA7/1GeNpp6H4qXjsdeguNooQI0uHEQUP4M5UepZpxa
	 POBTrGOcoNp31mjudJalbaKnXmDm3Wrd0tg/lBzJ10p06MYJYK+IVfsFvtg3I//2Sh
	 D9q6hoH8KEJX5ZKIdvL+BgiWCGDy7aGrBvvmhPZoxNb3+k8xraoup3uaAKKGs8bzxK
	 C8/ZtUgylRyJq1tZbJFT0YzI6ki+EjgSeCoM+HqiiwzjC/rcjuCR5CL+zgf8I3SNh2
	 cvV+Jb0qchXm8KEgKUZHvERB0O6gLpJnKBxToKy3bve+eaJudgvUWF1JhQMolPywKn
	 M6PTvE2xYcVfw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 23D08CE091E; Tue, 12 Aug 2025 10:39:09 -0700 (PDT)
Date: Tue, 12 Aug 2025 10:39:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	"Luck, Tony" <tony.luck@intel.com>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <ccc975e6-4249-42c5-a129-1b3f515f81d9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <aJpupN1KztXyglnN@lappy>
 <20250812114956.40dbb2fe@gandalf.local.home>
 <c1ea68c1-c352-40b5-a68a-790f618bb221@kernel.org>
 <743df9f7-70ff-4038-bec1-2fc938711be0@paulmck-laptop>
 <13a6b4cb-6566-4afa-b76f-bd18ce23ce18@kernel.org>
 <20250812131248.6b49f0cd@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812131248.6b49f0cd@gandalf.local.home>

On Tue, Aug 12, 2025 at 01:12:48PM -0400, Steven Rostedt wrote:
> On Tue, 12 Aug 2025 18:17:46 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > > Applying a patch containing the first tag might not be wise, either,
> > > depending on the outcome of a number of lawsuits currently in flight.
> > > Plus there are a lot of other countries that might choose to weigh in.  
> > 
> > Yes, that's what I wanted to imply. At least person applying the patch
> > and then later sending in pull request to next maintainer could not use
> > excuse "I did not know, that Assisted-by causes legal risk".
> 
> Once you add your SoB, it means "You know". As described in the Submitting
> Patches documentation:
> 
>   Developer's Certificate of Origin 1.1 
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
> 
>   By making a contribution to this project, I certify that:
> 
>         (a) The contribution was created in whole or in part by me and I
>             have the right to submit it under the open source license
>             indicated in the file; or
> 
>         (b) The contribution is based upon previous work that, to the best
>             of my knowledge, is covered under an appropriate open source
>             license and I have the right under that license to submit that
>             work with modifications, whether created in whole or in part
>             by me, under the same open source license (unless I am
>             permitted to submit under a different license), as indicated
>             in the file; or 
> 
>         (c) The contribution was provided directly to me by some other
>             person who certified (a), (b) or (c) and I have not modified
>             it.
> 
>         (d) I understand and agree that this project and the contribution
>             are public and that a record of the contribution (including all
>             personal information I submit with it, including my sign-off) is
>             maintained indefinitely and may be redistributed consistent with
>             this project or the open source license(s) involved.
> 
>   then you just add a line saying::
>  
>         Signed-off-by: Random J Developer <random@developer.example.org>
> 
> 
> If you add your SOB and then find out later that your AI tool added some
> code that was not allowed, then you broke (a) and (b), and I believe you
> are legally liable because your SoB means "You know". If you don't know,
> then you should *not* be submitting the code.

Couldn't have said it better myself, thank you!

							Thanx, Paul

