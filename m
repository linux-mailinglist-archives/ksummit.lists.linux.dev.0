Return-Path: <ksummit+bounces-1396-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4F930AB7
	for <lists@lfdr.de>; Sun, 14 Jul 2024 18:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8938B2099B
	for <lists@lfdr.de>; Sun, 14 Jul 2024 16:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C15E13A88A;
	Sun, 14 Jul 2024 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZrdubWkG"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D687C1E52A
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720973500; cv=none; b=jTM04Hw9EW0vCbxOxjhDu+PMIyO4y/5L+wSpyR85sltqxKmIEOkETX7fuYLIyP/5CDurdefML++/8gNpcOeOq12+iiitfzw565I4DtZAglGYcxm7fvsymb4LO5wmzWQPN+qG/j5J5zgxP1ahkOjEo9aGVeoxZjWLEKqt67y9twY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720973500; c=relaxed/simple;
	bh=jtv6Zn9k7GcZDmV/Df6aQeAcT/SOT0McRcf+ooDbFMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgY4sogMPm95ZoY7UWd8s7DTcTnwScvNJx1eUOL180WQmCY8RBt4eCRRrUCkwgWlboFCC6Ce5X3mH5qox3Yd9zCv+SnkB7Wo9Ma1Z8DqVbvsNu8WntC4k5FWYUj3sqvc9ihlgS9QyeHO0+Rvsw1j1+rFrbD2kWV1cl/iCGvWJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZrdubWkG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vUBRK4fNvHQsx8Rxtnk0VYoTx+N2w9yP9USdu8mW3v4=; b=ZrdubWkGG6IyBa3ttxENPTsQmO
	U3lE7MIwTWo02uMdKqzFonqVztV1AmxjN2ZWlpj8Z0nb0rwEtJaxhHRfp6smkXC24vPyfjYo5I5PZ
	zvwsfJUxFf0LphF1amRSnjjsOCRJekB+QA/O4yavIQwurslTnerMEZhe3h1gEEz7+atQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sT1GI-002VhQ-Gp; Sun, 14 Jul 2024 17:35:42 +0200
Date: Sun, 14 Jul 2024 17:35:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <61bb6e19-4eff-416b-a3d6-932f4a313f69@lunn.ch>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>

> One of the big reasons patches get Fixes without cc:stable is simply
> that it's an -rc fix for a merge window regression (so no released
> kernel has it in and therefore no stable kernel needs it), so you'd
> also need to explain that case in the improve docs (because it's a
> genuine fix, just not a stable candidate).

There is also the case where a patch which needs fixing has been
queued into a -next tree by the Maintainer. So it is not even in an
-rc yet, it is waiting or the next merge window to open.

So what we seem to be talking about is a Fixes: tag pointing to a
patch in a released kernel, which does not have a stable: tag.

Why not simply get 0-day to enforce such patches must have a
not-stable: tag? Such emails should quickly train developers to do the
right thing.

Or is this not a binary condition. Is there a legitimate third option?

	Andrew

