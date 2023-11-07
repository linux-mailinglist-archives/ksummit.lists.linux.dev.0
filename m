Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEC7E3FFE
	for <lists@lfdr.de>; Tue,  7 Nov 2023 14:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DB41C20C3E
	for <lists@lfdr.de>; Tue,  7 Nov 2023 13:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867E230CE8;
	Tue,  7 Nov 2023 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND72U8mx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C092FE3A;
	Tue,  7 Nov 2023 13:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194A8C433C7;
	Tue,  7 Nov 2023 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699363422;
	bh=aXFDULiO2PewQoXSfyNrT6njuw/uEAeWtRfzO+UMfTM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ND72U8mxJNyaHlZ+5428ajKpGakYDpclY0SifHeKNq0GfPvcEFas4qMPPXiURm2dF
	 1Liyw06nZmpwrNyB8au9fkgkfzCG82UTFswmah/361+CnN9rZGE+0exflodrRgxD17
	 GSKrlQnB187v9ttpgYCqlKhMX2641p5YA7Lc2qWQN4dZtKS3Fd+lYWrReVyRZEwEgR
	 na+MfyRo8zOm+qrCvcK6KZsQk2AWLFa25Z8dfWFs+D1PVmO6SObUvziq4VKQw1UYta
	 a7Y0JSmc5FR+P/25KBsWhXtQ8NW873rLQwsRcz0/qal9k7Asc/wGAFBbt8kgTOo+Fm
	 xW44xqtJipPCg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Pavel Machek <pavel@ucw.cz>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  users@linux.kernel.org,
  ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
In-Reply-To: <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr> (Julia Lawall's
	message of "Tue, 7 Nov 2023 07:47:23 -0500 (EST)")
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<ZUluOoDjp/awmXtF@duo.ucw.cz>
	<34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
	<20231107101513.GB27932@pendragon.ideasonboard.com>
	<mafs0o7g5hiba.fsf_-_@kernel.org>
	<b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
Date: Tue, 07 Nov 2023 14:23:39 +0100
Message-ID: <mafs0ttpxg0is.fsf_-_@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 07 2023, Julia Lawall wrote:

> At various times, I have wanted to see the discussion that led up to a
> commit, and LKML was the obvious place to go for that.  What will be the
> approach to take in the future?

I use lei with lore.kernel.org/all for that. For example, say I want to
see the discussion behind b6094ac83dd4 ("mtd: spi-nor: core: Introduce
spi_nor_set_4byte_addr_mode()"). I run the below query (on lore or on
lei, whichever suits your workflow) [0]:

   s:mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode() 

I then get the emails associated with the patch. This also works for
patches that arrived before I subscribed to any of the mailing lists. So
I find this method to be more powerful and complete than subscribing to
mailing lists.

[0] I have written some bits of code to integrate lei with gnus which
makes it easy for me to quickly open and read email threads. In the
background, it essentially runs:

    lei q --no-save -O https://lore.kernel.org/all/ -o mboxrd:temp.mbox -t "s:mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()"

which creates an mbox file with the results of the query. "-t" tells it
to fetch the whole thread of any email that matches this query. I then
create a gnus group from the mbox and read the emails. See the lei q man
page for more details: https://public-inbox.org/lei-q.html

Lei can do much more but right now this simple workflow works pretty
good for me.

-- 
Regards,
Pratyush Yadav

