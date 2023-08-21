Return-Path: <ksummit+bounces-1034-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1F782D17
	for <lists@lfdr.de>; Mon, 21 Aug 2023 17:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50D5B1C20955
	for <lists@lfdr.de>; Mon, 21 Aug 2023 15:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2789B847C;
	Mon, 21 Aug 2023 15:18:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5079F1
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA91AC433C8;
	Mon, 21 Aug 2023 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692631106;
	bh=xgpkaV95TNaSrPmg22JAXqA9yt1pWrc2kzrhe/kb6B0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=INn00JnCc/yDH0m7pXT9TjM6+fopmAgkD3p3/NW3Wl7ntzEuvHXNl3uEai0KAAvIr
	 bkFRyjNZc19oNDyJc/+jLKPv+H45MrvOmIkcj8LuhDr1DbAOy1uGLN6lBH7Lt8Te8i
	 H0M4AGboQBSk41Z/YbSyQg1luWi6gyMTnJrbzdjSgfIRnRLeennrTjZnqsXdmilVbR
	 M4gYMMl4GRT+x/L+953AAbrbz6Ehsgh2HQQeF9A8L4JuktgwzjBr2EzFwBEIL/kXDX
	 JBOjgu4MNSi+gYW2d27Af2MgZgH5kLzZr3/ZZp62F3/UADDUytrSO6C9Y+ThtxIDJS
	 mA1+oYgEaxwKQ==
Date: Mon, 21 Aug 2023 08:18:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linus.walleij@linaro.org>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>, Song Liu
 <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230821081824.1360d927@kernel.org>
In-Reply-To: <CAKMK7uG68PV5MZLjZXNLxsfdweKVZwz2UW9fuG1vLBEi8600dg@mail.gmail.com>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<20230817093914.GE21668@pendragon.ideasonboard.com>
	<44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
	<20230817081957.1287b966@kernel.org>
	<CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
	<CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
	<20230818080949.7b17b0d5@kernel.org>
	<CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
	<CAKMK7uG68PV5MZLjZXNLxsfdweKVZwz2UW9fuG1vLBEi8600dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Aug 2023 10:50:04 +0200 Daniel Vetter wrote:
> I think hearing what the networking folks do would be rather
> interesting, maybe in a split format with a presentation for the
> entire lpc audience and then maintainer summit discussion with the
> small group. There's a lot more maintainers and area leaders than the
> 30 or so who can participate in the maintainer summit.

Right, no preference on the forum. I'd basically like to compare notes
with other people who are trying things.

