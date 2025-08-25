Return-Path: <ksummit+bounces-2222-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D51BB33CDF
	for <lists@lfdr.de>; Mon, 25 Aug 2025 12:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19BE31656AD
	for <lists@lfdr.de>; Mon, 25 Aug 2025 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615A043ABC;
	Mon, 25 Aug 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3Y1Zjg+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF225B2E1
	for <ksummit@lists.linux.dev>; Mon, 25 Aug 2025 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756118106; cv=none; b=SkbVyW6T1yNmimU2AMRYFvnqqQk0SujiIy68bePbNctjPDAVjRCE9AvWTD6/kkPcKntWN1RxRdWLvRvekOW30TtOC8bhra11ySXFOmVY2+9+m8uYnXO2SruQhZ9ABrsT89UQVsh4zBT9xGMy7rHqYX58nEPYAmU/3YeludTpJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756118106; c=relaxed/simple;
	bh=90rIROMB8YYxN7qL3g5JePdGjhvMvJlHiYr8RCm6vOs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acpA84yuFEKurLGoTud7tSA5LQvZF2kkBN5CoWJ9v63wAZYQwSQlvmRtCMTpB3PsCnSZgRxcJINnFYZ06liJ+eGBwGpfa/0c/yZbtnPF0ieaI23cuTTewPQiOiLzI0WfId2vJjFCmUqq+bimvvgVxP9rEm65vS0WQtOHT8GEDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3Y1Zjg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D2EC4CEED;
	Mon, 25 Aug 2025 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756118106;
	bh=90rIROMB8YYxN7qL3g5JePdGjhvMvJlHiYr8RCm6vOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i3Y1Zjg+yBNJBGYFRVTfzQ1je+SlpOtapPyT1UgDMcdy4f6+jLzHyQTOZ9OTP8jNJ
	 jz1kEdqZ1j/yWzCQeIh8RgZH0KdN1kDUA2ipG2RLEq/yVjBIn879OGVRsmZ8hDwm5v
	 uZus41E+EyR/eR/IatS5VnuzVCTDNTgLGK78aqdhAKvoXzgrQGIsLbnXavld04sPA8
	 extw1p6I0Kja/tIxuy7V/4JSpvKWgVq7OzOwr6einfNghxZ7CMqv2tc7BsjHL4rI+M
	 yA4UUA0VaqKlWqFUd3EATGeCc+MvajT627KWN7OoBBAwCB5CFOCEwVeNMw391qqY0S
	 Cfiey6FlOI1XQ==
Date: Mon, 25 Aug 2025 12:35:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation - update and future
 directions
Message-ID: <20250825123502.167b9bc4@foz.lan>
In-Reply-To: <87plcndkzs.fsf@trenco.lwn.net>
References: <87plcndkzs.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 22 Aug 2025 16:55:51 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The last year has seen a massive amount of work in our documentation
> build infrastructure and continuous improvement in the docs themselves.
> This session will provide a brief update of what has happened recently,
> followed by discussion on what we want to do next.  How would we like
> our documentation to evolve in the next year or three?

Sounds a nice topic. Hopefully we'll have the improvements at the doc
build infrastructure before the Kernel Summit. From my side, I'd like
to keep finishing the cleanups at the Sphinx extensions, removing some
hacks that were introduced with time, and simplifying the doc Makefile.

So, for this year I expect that the entire doc build to be done
entirely in Python. For the next year, I think we can do some cleanups
at the conf.py, which has grown over time, moving the dynamic pieces
to a sphinx-build-wrapper code. I sent already a first version for it,
and I working now on a second version for the patchset.

For the next year, I guess we can focus (from the docs build side) on
a way to get rid of broken cross-references. We have a lot of them,
but they're currently hidden as by default, Sphinx doesn't report them
anymore.

I wrote already, as part of the kernel-include Sphinx extension, a logic
capable of discovering them and capable of propose similar references.
I'm  thinking that this could better fit in the future as a separate
extension.

Thanks,
Mauro

