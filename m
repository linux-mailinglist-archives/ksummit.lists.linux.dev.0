Return-Path: <ksummit+bounces-1257-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0091907CB2
	for <lists@lfdr.de>; Thu, 13 Jun 2024 21:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 459E5B28323
	for <lists@lfdr.de>; Thu, 13 Jun 2024 19:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA3A14D43B;
	Thu, 13 Jun 2024 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtQx3lYi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566A814D2A0
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307274; cv=none; b=Y9lKszbjt9KLi5aXG/Ze0IglQy8asktbgRKx6blx26vQVX+8SNbDtKhaQDbTtXa0SJugzWPLk14kHNFwIG2uEx+c1cForTsbcIjWLy1aYtIeXwX5ZqieYi8YhkPXJrDtUwmzMugH+edp54JM+NV+LD1SqwtxnoKrm3MQodEBcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307274; c=relaxed/simple;
	bh=n4tDahZ+rAgRPjI5g0aV2kZ3dbzXjBvg3rqfemmR2HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+jqIzq1c5iBIS3ck/ePEc+RfmbBV93lV7wi2IdXByjxrQrQGKyc1UKoadEEr/DOVpZ5ItgpF4gNxz2ojcmIjEtoMZVqfep26IX6+gx7G4iEAs2tmMu+ckPv2FD5xemVsTtmht3Z8I4y14QVbVmlg46aY6NaPAFzTE5OlKjPONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtQx3lYi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B72FC2BBFC;
	Thu, 13 Jun 2024 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718307274;
	bh=n4tDahZ+rAgRPjI5g0aV2kZ3dbzXjBvg3rqfemmR2HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtQx3lYis3NDhBy8YBvaPtBYShjIlz2vGqJw3cgKSSMyTFrUrbS2GQedSgebXDZT5
	 2y7F3g7LkfrZb2UH1BcR4C5OJ6FYO7VpGhGyqKdiSyxFBtM+7c0NjgoEw2jsdvG1Bz
	 fkUrFdvaU4Z6s31wRfvU6orc/crt4K2iFokTDBBs77iuMRMxMJYEbvt2lAmF4OvHS5
	 vgQ7/Y91M82LznGyC/FLs5NrQ+qoP1mMxqQoE9JdAkiP2HUCq3NGKkO8vmN7K/UOzx
	 Rb+kQB4+iPbE/oZzJrWHiyD+1OxxFb/NKsLj0wFxd3wdnj6xhFOjHRdQzPrVnetBsA
	 C5LDNFZ80JVYQ==
Date: Thu, 13 Jun 2024 14:14:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <Zms3F12AXGhErOrV@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>

On Thu, Jun 13, 2024 at 04:28:47PM +0200, Andrew Lunn wrote:
>> * One cause of regressions that happen in stable trees (and not in
>> mainline) I've seen quite a few times are backports of commits with
>> Fixes: tags that were part of a patch-series and depend on earlier
>> patches from the series. The stable-team afaics has no easy way to spot
>> this, as there is no way to check "was this change part of a series".
>
>This sounds like a tooling issue. git send-email knows a patch is part
>of a patch series. Maybe it should be adding some sort of cross
>reference between patches in a patch series.

This came up in the past, and we have some machinery to check if a
commit is part of a series or not, but in practice most of the series we
see are actually not ones where patches depend on each other.

-- 
Thanks,
Sasha

