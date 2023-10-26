Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D87D83E6
	for <lists@lfdr.de>; Thu, 26 Oct 2023 15:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E7228204B
	for <lists@lfdr.de>; Thu, 26 Oct 2023 13:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9382E405;
	Thu, 26 Oct 2023 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A02D049;
	Thu, 26 Oct 2023 13:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9D6C433C7;
	Thu, 26 Oct 2023 13:52:36 +0000 (UTC)
Date: Thu, 26 Oct 2023 09:52:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, Kees Cook <keescook@chromium.org>,
 Justin Stitt <justinstitt@google.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <20231026095235.760f5546@gandalf.local.home>
In-Reply-To: <710149630eb010b18b69e161d02502bc3b648173.camel@HansenPartnership.com>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
	<20231019054642.GF14346@lst.de>
	<202310182248.9E197FFD5@keescook>
	<20231020044645.GC11984@lst.de>
	<CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
	<202310201127.DA7EDAFE4D@keescook>
	<20231026100148.GA26941@lst.de>
	<710149630eb010b18b69e161d02502bc3b648173.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Oct 2023 07:39:44 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> While it's nice in theory to have everything documented, it's not much
> use if no one can actually find the information ...

Does kerneldoc provide an automated index? That is, if we had a single file
that had every function in the kernel that is documented, with the path to
the file that documents it, it would make finding documentation much
simpler.

Maybe it already does? Which would mean we need a way to find the index too!

-- Steve

