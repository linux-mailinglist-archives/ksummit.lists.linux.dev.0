Return-Path: <ksummit+bounces-846-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363E5F2441
	for <lists@lfdr.de>; Sun,  2 Oct 2022 19:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F274A1C20995
	for <lists@lfdr.de>; Sun,  2 Oct 2022 17:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F203C39;
	Sun,  2 Oct 2022 17:22:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE193C2A;
	Sun,  2 Oct 2022 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WrPbaSzv/4VTpUQ9MnAyS53i5Kj6rLDp3NY7/tDVztw=; b=OvQlOx5ZZw4CP48AFNVI2deyfe
	Ol30g08ywaOg9bD3puD/qsPlDBK12Mg5FB11JR0RjpSX5yAwO6irp1AImZd4Wgc3OJeo+HpuZhEIO
	TN97f03Vn0rleSTFppqLyCJzZhe4Nz4BHJz0tF9mh7N2gWQJF/o+lnaai7R9u37fj4Ftx5DMBHSv7
	UTqFZIB+miCew9pUwR+HRUJiokFDWu4C47FlC3H+aBtQ5ixJzhE/44uTHSFy7kk2Pbn6jnYSOLqAz
	pbcbDRzQbW1S9ENq5l1kncNBGezXOarq7RdESeDiJZt1rU9IKxgxrhB6KFrg9WvH0CBWpgkx89D9t
	jlF/SVyQ==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:59397 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1of2fU-006dyC-VR;
	Sun, 02 Oct 2022 13:22:21 -0400
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <Yzm0mia7ndwFGk2c@ZenIV>
Date: Sun, 2 Oct 2022 13:22:14 -0400
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 regressions@lists.linux.dev,
 ksummit@lists.linux.dev,
 Mario Limonciello <mario.limonciello@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C107EF2-9842-40D9-A23D-FCFD610A9104@sladewatkins.net>
References: <Yzm0mia7ndwFGk2c@ZenIV>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hi,

> On Oct 2, 2022, at 11:56 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>=20
> OK, then - please tell me how to prevent e.g. =
linux-fsdevel@vger.kernel.org
> getting spammed by that thing.  Where should I go and how do I =
unsubscribe
> it?

Exactly. It=E2=80=99d be nearly impossible, not to mention that you=E2=80=99=
d have to (somehow) do it for _a large number of lists_.=20

I=E2=80=99m sure there is a better solution, but this isn=E2=80=99t =
it=E2=80=A6

-srw


