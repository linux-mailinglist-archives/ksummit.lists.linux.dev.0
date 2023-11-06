Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F27E2967
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51A3F1C20C30
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B17329400;
	Mon,  6 Nov 2023 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A928E0C;
	Mon,  6 Nov 2023 16:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FBCC433C7;
	Mon,  6 Nov 2023 16:05:45 +0000 (UTC)
Date: Mon, 6 Nov 2023 11:05:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106110547.6956a430@gandalf.local.home>
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Nov 2023 10:33:21 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> For this reason, I propose switching the "F: *" entry in MAINTAINERS 
> ("THE REST") to patches@lists.linux.dev instead. This list differs from LKML
> in the following important aspects:

As long as it doesn't affect those that have L: linux-kernel@vger.kernel.org

All core kernel changes should still go there.

 (Scheduler, timing, tracing, interrupts, etc)

-- Steve

