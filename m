Return-Path: <ksummit+bounces-1344-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9889116B3
	for <lists@lfdr.de>; Fri, 21 Jun 2024 01:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5400E1F223D5
	for <lists@lfdr.de>; Thu, 20 Jun 2024 23:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B442B14373D;
	Thu, 20 Jun 2024 23:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrm9pWck"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B943ABC
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 23:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925913; cv=none; b=rOIVVCjMrlPwKJ9j4afZ6cbqMcEO7sbThfCS9diztO00I8MSo771J6HWD8qrrkUJQRdyiQPHGWWY+MaJ64TnwE4xhNcPb6lJsYTgrzGd+oAxn3jhPEiQXyxiWDNriCUSg4rrqrDC0snPPFL2MPU67ZFyilAH0M+/LHcUm4q9Cno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925913; c=relaxed/simple;
	bh=pzgyuKM0T/4fBJcdepdtwq5o++NYqCa4DiY4Tkx1+uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huxE0aVG0NLkLtWgLdkwd+cCq/A182e/yx/TN8krxBep+v5II+2Dz9YsMwQmaoR4YtX7z6pjMYcHf1Nq1kRiWsQA4ij2t/lXJvvQK7Kht8DmmpcR3yXLyIGXo6Nj2b6cbt1G2BZ6O7tN7dex5OSec36dJscaO6lyHEU3MMrrhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrm9pWck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C86CC2BD10;
	Thu, 20 Jun 2024 23:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718925912;
	bh=pzgyuKM0T/4fBJcdepdtwq5o++NYqCa4DiY4Tkx1+uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrm9pWckVS8TTYBOTNkXWGsZfmTLSXGie/FK+ts34yw57w62LyGRKzbAS0gz3BQsf
	 MA8b1fu5V1/okCtx2cQw9PZDf70O1SR763sO9J+3uVj18ijDNs3dgV9/txx4KY24wM
	 lN5NUI6zjwEjRdd/pLRPHh1rXPi+grXH5SNQCJDPmrMoQkH8BxsYRYdtpjS+7Pqy/Q
	 lfLaDjKf3il3mlmJoszZMkowYkT/NdUGbI24EIsD3F4iBOxVQdrc8sagZMFQmSNOaJ
	 dBWauU64dsUUujGkhaDNV9dlA//ncOhL7d5wohXbITEbGjPQNARALkWBc0icUzk2EB
	 4O2j1lTZkgxiw==
Date: Thu, 20 Jun 2024 19:25:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Message-ID: <ZnS6V3mZhSH7t-_v@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>

On Thu, Jun 20, 2024 at 12:02:21PM -0400, James Bottomley wrote:
>Right, but the point I'm making is that even that wider pool doesn't
>have the app use or hardware breadth of the pool who try out stable.  I
>also agree the stable users would rather not be testers but given that
>they are, it's not impossible we could sell them on the idea of testing
>out .0 to find bugs they would otherwise be finding in .n.
>
>After all, given that stable is now delaying backports in the merge
>window, there should be at least a 2 week period where .0 is it
>(although it's also the two week period where we're not paying
>attention ...)

We also keep the prior kernel alive for a few weeks *after* a merge
window.

We understand that X.Y.Z for Z<~5 kernels receive many changes and need
additional testing, and so users have the option of staying on the Y-1
kernel for a few weeks until issues with X.Y are settled.

So yes, users should have "at least two", but really "at least five"
weeks to find out issues in a post-merge-window release.

-- 
Thanks,
Sasha

