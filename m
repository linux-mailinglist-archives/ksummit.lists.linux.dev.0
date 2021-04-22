Return-Path: <ksummit+bounces-49-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A7902367E62
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CAD411C40A8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 10:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036CD2FA1;
	Thu, 22 Apr 2021 10:13:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AA71
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 10:13:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C73460E0B;
	Thu, 22 Apr 2021 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619086420;
	bh=vrfvBn4NlgXy0vEwwPq0pnqaKoQc4fcGGTJDQpQTKu4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IpOpK3M8/kDq6KVq/i2FSM94SKVkZazKxR1JbLSz0MUF0rqRsfSeLUEG80dXAInNf
	 2+Aco4VAvlbQuP5ToD0a5Kyv60xkOV2alfPpVTZT5f2ru9XyxDbfiX62dMIr1ur+6k
	 bAcDQ0kyD6pjDqtd//1dNN0d3lv3URSlj1laWnc7NP6pFnXx06yXcHDOO1JtE1pvWZ
	 8WlxcBtxNpnRT+swFN2W1mfCuEqkQ7OdolxRHt7BaZE7jguEf21Jup0JHAfv7lDMSn
	 der445H76UW4yYkE3qJaw8oSubXXjWisI8erS7VpHq/W67ohUCPYztsBJAC0m7fQzs
	 FgVvvS7SVlIhA==
Date: Thu, 22 Apr 2021 12:13:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley 
 <James.Bottomley@HansenPartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422121336.097d5329@coco.lan>
In-Reply-To: <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
	<b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 21 Apr 2021 20:04:17 -0700
Joe Perches <joe@perches.com> escreveu:

> On Wed, 2021-04-21 at 22:05 -0400, Martin K. Petersen wrote:
> > James,
> >  =20
> > > Our policy in SCSI for a long time has been no trivial patches
> > > accepted to maintained drivers, =20
> >=20
> > I'm afraid that ship sailed years ago. I am merging a ton of trivial
> > patches in SCSI. =20
>=20
> True and thank you.
>=20
> Perhaps the primary thing that James' email shows is that he's not
> actively watching drivers/scsi/ git tree changes very much.
>=20
> And I believe James is referring to whitespace style trivial patches.
>=20
> > The reality is that not merging trivial patches is a losing battle. The
> > various static checkers appear to develop defect detection parity and
> > gcc and LLVM get more picky with every release. =20
>=20
> True, but perhaps most of the pickiness can be mitigated by moving
> various warnings to W=3D2 or W=3D3.

Not sure if this would solve anything. Also, it starts showing a lot
of false-positive issues, like those:

	./arch/x86/include/asm/bitops.h:283:28: warning: declaration of =E2=80=98f=
fs=E2=80=99 shadows a built-in function [-Wshadow]
	  283 | static __always_inline int ffs(int x)
	      |                            ^~~

	<stdin>:21: warning: macro "__IGNORE_stat64" is not used [-Wunused-macros]
	<stdin>:22: warning: macro "__IGNORE_lstat64" is not used [-Wunused-macros]
	<stdin>:157: warning: macro "__IGNORE_madvise1" is not used [-Wunused-macr=
os]
	<stdin>:73: warning: macro "__IGNORE_llseek" is not used [-Wunused-macros]


Btw, -Wunused-macros is probably that it probably doesn't make any sense
to have "fixes". Having things like:

	#define SOME_UNUSED_FOO

won't cause any real issue, and attempts to drop those would result
on lots of ifdefs for no good reason, like:

#ifdef CONFIG_FOO
#  define SOMETHING_USED_ONLY_WHEN_CONFIG_FOO
#endif

I would move it to be out of W=3D2.

Thanks,
Mauro

