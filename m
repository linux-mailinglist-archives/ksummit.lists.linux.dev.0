Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E314F7E2AF4
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FD92B20F34
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E499629D0F;
	Mon,  6 Nov 2023 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4F29CF9
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 16AD26343CD7;
	Mon,  6 Nov 2023 18:23:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UM6T4RKan3jy; Mon,  6 Nov 2023 18:23:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AAD1863DCAC6;
	Mon,  6 Nov 2023 18:23:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VmxH8idqvLUa; Mon,  6 Nov 2023 18:23:10 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8D8766343CD7;
	Mon,  6 Nov 2023 18:23:10 +0100 (CET)
Date: Mon, 6 Nov 2023 18:23:10 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Message-ID: <572860847.59829.1699291390371.JavaMail.zimbra@nod.at>
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: switching "THE REST" in MAINTAINERS away from linux-kernel@vger.kernel.org
Thread-Index: PUahPjNMDoB8PKFO0WabflKHDkLlBw==

----- Urspr=C3=BCngliche Mail -----
> Von: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
> - due to the sheer volume of messages, LKML is generally seen as useless =
for
>  holding any actual discussions

I disagree. Of course I'm unable to follow all mail but I regularly
browse LKML to see what's going on.
Without LKML I'd have to subscribe to hundreds of subsystem specific
mailing lists for no reason.

Thanks,
//richard

