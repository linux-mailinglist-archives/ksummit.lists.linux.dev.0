Return-Path: <ksummit+bounces-2792-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LaJCHBgc2kCvQAAu9opvQ
	(envelope-from <ksummit+bounces-2792-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 12:50:08 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F875616
	for <lists@lfdr.de>; Fri, 23 Jan 2026 12:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 943C63025D06
	for <lists@lfdr.de>; Fri, 23 Jan 2026 11:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7274B30E0D1;
	Fri, 23 Jan 2026 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iefej1VV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254D2E06EA
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168825; cv=none; b=Jz526+ZSQPAKPu/9tLZsBIsUA5/S8mHBuTPo6qI108jcekCRgpbKRAVwbzjN9qYo/ev7e33PUhGcx3Zpv2V74mRvDfmXHUkg2YeQnKmTPXQOc0/xLcrSN6dDtnKMZS1hDCDT248nqZZ7H0hZ6JZRI2a21NEJEUe6U9ZFpJnCzfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168825; c=relaxed/simple;
	bh=KztNJ/M+v0P3S+yv7CqIih2ALTGTuOgPv0otVjUYaLk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+x6QSkF9nuLUWxNWtbFOLINs3OWV6vDGLNEFwNmMk28NJcM4bIcyZmXKTg0mA6jtTPf04ek3VncB7CMhH10ssMobNhCnYgyqDsFN1rSEHb/9AJ5GX02PNnK7jszUfu8PKfJcgIR8kz5i9IRrhHfgJzkBMqewNtdSbGFVX88F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iefej1VV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B3FC19421;
	Fri, 23 Jan 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769168824;
	bh=KztNJ/M+v0P3S+yv7CqIih2ALTGTuOgPv0otVjUYaLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iefej1VVzIrj2ZdGn3cfv+1UkYbt9awAKQ9hkdg+1XwO/G0B4mYU6/Grb97J+TcZY
	 dDQRvsFSNJ+Dr6qKHEWO56yF/FbVf53m2XVxslv3zo3nzMYf8yOD3afYLTDH1HB9NG
	 phKa2fTKKn6yWWt1oQvvNZx+Z+tnp5por1LY0noNrg3hEShhSiw3LuvRxxgzfDo596
	 oJ/Ul3RrC2y81uVIrDDdWgtB9c17hmLXHvh2zYSYT3l5x3cGkbK9+yK1FTOVPr6266
	 9oySlyUZ1wDTESWnngGBUYgMh0uypGd2P/vNifwhTNEchG3Qv2Y7FE6A9mZG6rd+tq
	 yu/zUG6GzV/ag==
Date: Fri, 23 Jan 2026 12:47:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123124700.0ab2a954@foz.lan>
In-Reply-To: <2026012340-cannot-spud-5d46@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2792-lists=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid,sched.com:url];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 6E2F875616
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 10:29:28 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Konstantin,
> >=20
> > On 12/10/25 05:48, Konstantin Ryabitsev wrote: =20
> > > ## Web of Trust work
> > >=20
> > > There is an ongoing work to replace our home-grown web of trust solut=
ion (that
> > > does work but has important bottlenecks and scaling limitations) with
> > > something both more distributed and easier to maintain. We're working=
 with
> > > OpenSSF to design the framework and I hope to present it to the commu=
nity in
> > > the next few months. =20
> >=20
> > the current home-grown solution is https://git.kernel.org/pub/scm/docs/=
kernel/pgpkeys.git/, right?
> >=20
> > I wonder what the bottlenecks and scaling limitations are that you ment=
ion.
> >=20
> > Is there some info available already now about the path you (and OpenSS=
F) intend to propose? =20
>=20
> There will be a presentation about this in February at a conference and
> hopefully it will be made public then as the work is still ongoing.

I got curious when I saw something about "First Person credentials"
at https://lfms26.sched.com/event/2ETT5?iframe=3Dno that=20
"would begin with the Linux Kernel project" - and more importantly
how and when it would affect my duties. I guess I'd need to
refrain my curiosity until the end of Feb :-)

Regards,
Mauro

Thanks,
Mauro

