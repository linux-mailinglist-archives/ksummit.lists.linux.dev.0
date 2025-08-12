Return-Path: <ksummit+bounces-2143-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED8B22CDF
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE4BC175817
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A1B305E31;
	Tue, 12 Aug 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxzmZpYc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A0305E21
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014775; cv=none; b=BcJRFQP8ayhyNM0ATEQHl9+766cRiuTr2QMb6HvKFdJSb0FDI5YKQkJ8ZgXegY3QKJcD2j1U7vcrKrgRaI8aafntcxs+KHgTzUy3NY8xI/NGfG+WYcCL/xKsueR+tK04mOzLwbnMj9LMnJWdInp5jjgQZBog61SIXb6eLpM2NCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014775; c=relaxed/simple;
	bh=ypjpNJlWjAOObnCbcm9X1ZR9n99wnTMpOzS3tEtT05E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVh/4UsnfKAiXnHU1dOdvgB7xaUmcmFSuC2nt0l0B4s8fWrYj4Izs5+Y0goqMAEZW3lb4IUWkyVNgOYBML+Ar+MZuANKeW5YnQ2pYIP1nNaekItKJ5z21lh4FMaLjn+0CX6g2dFfeBrq1BiqAqCyCwAAeoR4U45asq5X02pTczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxzmZpYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812FFC4CEF1;
	Tue, 12 Aug 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755014774;
	bh=ypjpNJlWjAOObnCbcm9X1ZR9n99wnTMpOzS3tEtT05E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DxzmZpYchEOOZeUDaUknUCGu0YT+KYp5Rx6wXubTIW8BTk6fDQOQ/uW4e2Io7XZ0o
	 Y+lOWfi3suW7cMg0RFCmTMAnnS/azWX244jGxJTcWvgm0Hka7clLWKI3hgIpJZ/5v+
	 qcK6W1SrzaTqZMQxNsWaVsVEPPYnWhy5MBx9P5i20CrI1svm2JjlMrL0xx9uwIgS8B
	 UsEG9SOR/c9pRFg57LjCG+KcSXTOIdnXtYbpqKAXyz3c+X3QWi7404rnbFlc5q/V/u
	 SPfS1FKSNcBFSBnv8PrHjlwXf/eaSyeQr2uIFk3BzeuUQK6YesMIRnfu+WJhfWthTV
	 jeQrQQsUQ5+kw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 252A9CE091E; Tue, 12 Aug 2025 09:06:14 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:06:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Luck, Tony" <tony.luck@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <3ee3d311-21e1-4210-b53a-ba067c1b3601@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
 <87o6slbhap.fsf@trenco.lwn.net>
 <042b0357-3d0f-4451-85f3-631753343a8a@paulmck-laptop>
 <20250812114701.5540e038@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812114701.5540e038@gandalf.local.home>

On Tue, Aug 12, 2025 at 11:47:01AM -0400, Steven Rostedt wrote:
> On Mon, 11 Aug 2025 16:03:34 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > At the same time, I freely confess that I am not yet seeing an option
> > that brings us much joy, at least for values of "joy" that include actual
> > incorporation of AI/ML source-code output into the Linux kernel.
> 
> I guess it will only bring AJ (Artificial Joy) :-p

;-) ;-) ;-)

							Thanx, Paul

