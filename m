Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0367E2F0C
	for <lists@lfdr.de>; Mon,  6 Nov 2023 22:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D138B20A94
	for <lists@lfdr.de>; Mon,  6 Nov 2023 21:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9602EAE2;
	Mon,  6 Nov 2023 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxRHmIRV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD34B677;
	Mon,  6 Nov 2023 21:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6738FC433C8;
	Mon,  6 Nov 2023 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699306634;
	bh=f3/bILWQ4YseecDB/swjFDxcwVtCEY0fbUy0pr7jdwM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lxRHmIRVFsnBKrA05BYL3EfmJYRZSmY/18C1gFUdYqK49AcUyx8fSWaQ0ap2hR0nH
	 JPsLbIQyayPwP8WOXenH3FnuH/yu/vE7oXfcZaFyQqkcH6JUHguErC8qixZGF/wng+
	 hMA0BtdXQR/ayFSKeyyI5jTRyQkx7GXGOrjewhCqR3bPyE6buZVkyVLtZV+7e0tv3q
	 sXvAF5mQJ4ChOjJVR9tO3XR6boEPORCJqw4tFEWwQi5aEWL43w3/baPTF3FZPdxKAk
	 /CjjwqyNifSCf5tX8p8T2Lpz3iGOFX9zM009gPCMr4er34Id1u4QSTeuhPWGb0ZfrJ
	 SE4llMHHx3vTA==
Date: Mon, 6 Nov 2023 13:37:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106133713.208c98ab@kernel.org>
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Nov 2023 10:33:21 -0500 Konstantin Ryabitsev wrote:
> About 70% of all vger traffic is linux-kernel@vger.kernel.org ("LKML"), which
> is explained by the following 2 facts:
> 
> 1. There are ~2900 subscribers to that list
> 2. It is added to all patches because it has "F: *" in MAINTAINERS

For networking, at least, I think that there is a solid correlation
between being a noob and CCing LKML. I would be tempted to add at least:

X: drivers/net/*

to the "THE REST". That should knock off a few k emails. WDYT?

