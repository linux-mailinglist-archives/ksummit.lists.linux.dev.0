Return-Path: <ksummit+bounces-1069-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E178C48A
	for <lists@lfdr.de>; Tue, 29 Aug 2023 14:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507A4280A96
	for <lists@lfdr.de>; Tue, 29 Aug 2023 12:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29402156DB;
	Tue, 29 Aug 2023 12:54:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4593156CD
	for <ksummit@lists.linux.dev>; Tue, 29 Aug 2023 12:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF163C433C7;
	Tue, 29 Aug 2023 12:54:07 +0000 (UTC)
Date: Tue, 29 Aug 2023 08:54:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jakub Kicinski <kuba@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>, Song Liu
 <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230829085405.5faf3b51@rorschach.local.home>
In-Reply-To: <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<20230817093914.GE21668@pendragon.ideasonboard.com>
	<44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
	<20230817081957.1287b966@kernel.org>
	<CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
	<CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
	<20230818080949.7b17b0d5@kernel.org>
	<CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
	<20230819064537.GM22185@unreal>
	<e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Aug 2023 21:23:18 +0200
Vegard Nossum <vegard.nossum@oracle.com> wrote:

> Can we maybe adjust the standards of the Reviewed-by: tag to mean that
> the person has looked at the patch (or an earlier version of it) and
> provided comments that show they actually put some effort into it?
> For example, if a patch is changing a function (as patches often do),
> the reviewer should add a line saying "error paths in foo() lgtm"
> and not just tack on their Reviewed-by: line.
> 
> This adjustment would make it harder to just slap a Reviewed-by: on a
> patch, but it would also make it easier to get your name in the
> changelog provided that you actually put the effort in.

Note, when I can't do a real review, I just slap an Acked-by tag to it.
That to me means LGTM, but I haven't looked deep into it.

-- Steve

