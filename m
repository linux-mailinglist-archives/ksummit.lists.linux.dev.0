Return-Path: <ksummit+bounces-2827-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFjULe7MeGmNtQEAu9opvQ
	(envelope-from <ksummit+bounces-2827-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 27 Jan 2026 15:34:22 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AD95CB6
	for <lists@lfdr.de>; Tue, 27 Jan 2026 15:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3135300463A
	for <lists@lfdr.de>; Tue, 27 Jan 2026 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0614F35C1A9;
	Tue, 27 Jan 2026 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yio8WKCF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74335C18D
	for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524456; cv=none; b=t93PTNzwDtmLB9jAaQGHTeJi2XrqhNCHOb24k83UVRyrXE+qVuguW98qVrPC5/NKX3JnZ3Cn59mlxQc6fL5JHwTDdvoQcHL0vgjwou/NOUb4OaXFYyHhRCWZtAEbJ8BnuVahMY+LSAIou36GdW82k5cAiSPD7SVWkXk26KYyWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524456; c=relaxed/simple;
	bh=0ltfRTfg3wkbevTvVBw5yxwbXJED7KBBhy5SACWLeRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpDizgQ5i4eZnzDTvVkOjV9+2ULwDN/mOqtMRuy4ZkcebLIsB+JwxhbdMWPsk8B+DrICwOyO5f3hap2DfrQvCPC/sN7fArZyPCXT7rnuzZ08QvX4rAIa/V2bLtTmJM3bPZI/WaNRAB1SeR4pZ6eV34ADh1aJtB3epiS3i2wpMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yio8WKCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130D7C2BCB0
	for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769524456;
	bh=0ltfRTfg3wkbevTvVBw5yxwbXJED7KBBhy5SACWLeRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yio8WKCFv5LwJNLYDQJYK9R9CYGPvpkabMEXiIJKijBszFLR22MIxurBd41EnnAaC
	 72pIlLWnooaD7XE8CEMtYIGCAIKjsZnBCycweOoomL+UQdfvZiRejxco/7CdAXIelF
	 vuVkg2dU8i+BiK9SOga+yUHvYVfy01TirS0GB4G61QkJemmZnzjmx8ywLh6RJQKb88
	 l1WpqhBTHxoVeLUnrDY1hSLVCPt3cOf0zbTNnfLqaZNa5ySmzGaUzsHGCFijWh7mXQ
	 ET737Of6wVxjb1DouwdZYjCTGjHi0aB4Kq4a5FrtIoLs2AgZ+Me2abE266T4vitvWq
	 0Jz1bMSbSNP0Q==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64938fce805so5339607d50.1
        for <ksummit@lists.linux.dev>; Tue, 27 Jan 2026 06:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVleFm2GkVQ7a5SF8MrwktST6+5rjJIOSC2Q0lFLFFNoj/ZBAbcORF2odA7r0JU/MqvWM7X5esp@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9OkH65ZUxjGy03boh6IrHE85O9NGnSFJWsNz0x0TrdHJoghQ
	1s0VCZ+7cl37heCh2rmtx0O+8mL6Is4UILpOM0LbxUPYkc3u1GPXucnZ1WR/Ct2YfCfNH149MUH
	Q3dSHlrX8TJj++KBWNPWn5h6rdKWR3ZA=
X-Received: by 2002:a05:690e:1901:b0:63e:3b29:f1e1 with SMTP id
 956f58d0204a3-6498fc08d6amr1321228d50.36.1769524455363; Tue, 27 Jan 2026
 06:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
In-Reply-To: <20260124012256.1856709-1-dan.j.williams@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 15:34:04 +0100
X-Gmail-Original-Message-ID: <CAD++jL=mML3RGt=eSR4LD=1rB4jgBxE+RSF1vBGiTYh8AWp+-g@mail.gmail.com>
X-Gm-Features: AZwV_QgBU02rsoKGX4K7RJIGW4T_LXTmHfF-ZaWXUiDqMajmaoGpPE5lHRJA3M8
Message-ID: <CAD++jL=mML3RGt=eSR4LD=1rB4jgBxE+RSF1vBGiTYh8AWp+-g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Project continuity
To: Dan Williams <dan.j.williams@intel.com>
Cc: corbet@lwn.net, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	tech-board-discuss@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2827-lists=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid,linuxfoundation.org:email,linux-foundation.org:email]
X-Rspamd-Queue-Id: 6C0AD95CB6
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 2:21=E2=80=AFAM Dan Williams <dan.j.williams@intel.=
com> wrote:

> Document project continuity procedures. This is a plan for a plan for
> navigating events that affect the forward progress of the canonical Linux
> repository, torvalds/linux.git. It is a follow-up from Maintainer Summit
> [1].
>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Co-developed-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Link: https://lwn.net/Articles/1050179/ [1]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

FWIW:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

