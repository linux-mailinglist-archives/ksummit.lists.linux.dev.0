Return-Path: <ksummit+bounces-2794-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOrLE7Fpc2mivQAAu9opvQ
	(envelope-from <ksummit+bounces-2794-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 13:29:37 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACF75CCB
	for <lists@lfdr.de>; Fri, 23 Jan 2026 13:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA80318C12E
	for <lists@lfdr.de>; Fri, 23 Jan 2026 12:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211C30EF81;
	Fri, 23 Jan 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU+SpgFj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21EA314D2E
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171093; cv=none; b=WsqkTkTlgcvyCbFiKq2Iq+jYoK20QQLMAs/XZ4LNwoJB6lakp8M7LncoR6Kj3M4BB0rjLfhp7VhA4ptyq97oBQmm74KyX5qy+/CHxSiTDMs7ZWxbIGJgPfak8PjJqUnlAnEgkn+MHvBr/Ow9x/kuphqha6P7MKvd5p7j/5lD+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171093; c=relaxed/simple;
	bh=GJtnImtirU7r2n0a+fp95a3LeIzeIDqZJYWUSQ16ELg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRPWUbwqCaYigUedISc+0IqM6nOwthZogUNWtJIQMko8kf6c+1KVydmBjvhBYo8+FpLU6w1r7lnScdaKuEGSdjpbi6Aa6+q5nDmEtD0iNw6TXf55rb0AvRa8iYwVuDVVWiZiZ9smrgHKhzyN/68dzCwfnt3tiRAfxoablMfZgT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU+SpgFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F8BC4CEF1;
	Fri, 23 Jan 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769171093;
	bh=GJtnImtirU7r2n0a+fp95a3LeIzeIDqZJYWUSQ16ELg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HU+SpgFjPDql3Mypg2+knW8ZehqXdwrmrfwAEkxcNYgcArQfq1Od03of4/e8sXeh2
	 YAbyr3RnCQ4gkGVL/OEKkUBk8+kQdw3feLgVnJq29wts7yg9JcIIcyZ+f8rbgNfrHh
	 ATLOjrV1KAZTmCJFJ4TIYt31gOzPDOlQkwJzwfH1GOUAaaV+pX99skngIR+RowYo5Z
	 0M9RpN8UQKrP3Oi4b2nrrzLwvfoss2i7GDaLSHOnAS/qyFfFOZHR5KtxGEofkwNQ85
	 ExJSGkcm5QtGJMM0a1sFSe4zhoAQ1gLlMDn0nI60miiuYci9LDEgEl1kXBO763XRXk
	 GwbPTLQeHSRxg==
Date: Fri, 23 Jan 2026 13:24:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123132449.3f8a01dd@foz.lan>
In-Reply-To: <2026012320-tiptoeing-backspace-241b@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
	<20260123124700.0ab2a954@foz.lan>
	<2026012320-tiptoeing-backspace-241b@gregkh>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-2794-lists=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sched.com:url,foz.lan:mid];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: A7ACF75CCB
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 12:58:48 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Jan 23, 2026 at 12:47:00PM +0100, Mauro Carvalho Chehab wrote:
> > On Fri, 23 Jan 2026 10:29:28 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >  =20
> > > On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-K=C3=B6nig wrote=
: =20
> > > > Hello Konstantin,
> > > >=20
> > > > On 12/10/25 05:48, Konstantin Ryabitsev wrote:   =20
> > > > > ## Web of Trust work
> > > > >=20
> > > > > There is an ongoing work to replace our home-grown web of trust s=
olution (that
> > > > > does work but has important bottlenecks and scaling limitations) =
with
> > > > > something both more distributed and easier to maintain. We're wor=
king with
> > > > > OpenSSF to design the framework and I hope to present it to the c=
ommunity in
> > > > > the next few months.   =20
> > > >=20
> > > > the current home-grown solution is https://git.kernel.org/pub/scm/d=
ocs/kernel/pgpkeys.git/, right?
> > > >=20
> > > > I wonder what the bottlenecks and scaling limitations are that you =
mention.
> > > >=20
> > > > Is there some info available already now about the path you (and Op=
enSSF) intend to propose?   =20
> > >=20
> > > There will be a presentation about this in February at a conference a=
nd
> > > hopefully it will be made public then as the work is still ongoing. =
=20
> >=20
> > I got curious when I saw something about "First Person credentials"
> > at https://lfms26.sched.com/event/2ETT5?iframe=3Dno that=20
> > "would begin with the Linux Kernel project" - and more importantly
> > how and when it would affect my duties. I guess I'd need to
> > refrain my curiosity until the end of Feb :-) =20
>=20
> Ideally it will not affect anything, just replace the use of gpg however
> you use it today for kernel work.

I suspect that, at some point, we'll need to setup our new
credentials somehow - hopefully without needing to be physically=20
present on a gpg-like key party. If we can do that using our
existing infra or our current gpg keys, the replacement should be=20
easy.


Thanks,
Mauro

