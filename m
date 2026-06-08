Return-Path: <ksummit+bounces-2925-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Bh0EuRKJ2reuQIAu9opvQ
	(envelope-from <ksummit+bounces-2925-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 09 Jun 2026 01:06:12 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7865B1FF
	for <lists@lfdr.de>; Tue, 09 Jun 2026 01:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bCdK94qZ;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2925-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2925-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BA903020AB4
	for <lists@lfdr.de>; Mon,  8 Jun 2026 23:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127EE36073E;
	Mon,  8 Jun 2026 23:06:08 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971833D4F0
	for <ksummit@lists.linux.dev>; Mon,  8 Jun 2026 23:06:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780959967; cv=none; b=rTX2nh9BHUv1/4Ldsfe5/sRGRbW3ITkGYMCxwK+ic0Ats1t73ClSDXtP/5oqou27PwEON7IXORsA8hY5iYpZdVCK93rQ38mHSmOaEx0dXG/sraQPuNlILG5dHf+vQ9gUh4ioJGeiKwPkE13KvTadBD0xtnyK8f0KJZ2VngbwvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780959967; c=relaxed/simple;
	bh=6rN69WnrWy+Dwzkr4NDLDlXrjFEjfTD7iUzD1apycAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTPUG2ulcXflUCUwHTMH9DHek8BgLgM+h368pzDFQEiWYcF6XYkiZX7KPHf33SKVMtyAHQH+rV//izcfyY+01B/aHfLVetVIXyea/vwERZdbxG/rIwzR9b4Pk3AT+NQ5+Ul9a27KpJRqgMXCMH3UeZnCb8DE/9vtoVvCXQH+f5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCdK94qZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9041F00898
	for <ksummit@lists.linux.dev>; Mon,  8 Jun 2026 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780959966;
	bh=6rN69WnrWy+Dwzkr4NDLDlXrjFEjfTD7iUzD1apycAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bCdK94qZ5U1jeW3PUWsuYwOZedqbWlfe7RbnvOh/Rdzkov9BKwaCSbsHkd0gpm9Rh
	 H/r1Tb3JUGDuo5JGggCANWaXmF+FEoeERxs0c91mf+RHVRJmRRaIdzAN87D/OEBAaB
	 zaArjDnkaPRNayMmvAvCNnMk0q3g8vmX7nvZgGSw6HAxe7v1XO8i7nSzm/LCTb0E6k
	 Gp7CFh7omK2kWC3MStvh5JqwhSCb4SaKjEWrDlhEZ+V0xoNYcqEpxjX2Bu3yn40Pcx
	 Ma1cp1YxEC8reiqAlOQxk/NGQlJed7xmR+cC/+i0h2gV0QRc60HQeQrySFjJYRVVYA
	 OL6rachOiI+Gw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39666f49929so44242641fa.0
        for <ksummit@lists.linux.dev>; Mon, 08 Jun 2026 16:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82AYKycdzzDfMQr4zeel1e+17hf4YgWii9zGNpf3AN6+fD2UfHNq61uGqLTAiamO7VPrDx4xF4@lists.linux.dev
X-Gm-Message-State: AOJu0YyW5U/0EE75r6gilAIQAWq+OdeQSWj7ceD3cYwHQHXqVQgpObl+
	3Bre4Z+WJd/1vkajJ2DV6RrCpEFmb+fq8fHa/eFQqmFaKRIt7zqDTDJtv9kZLb3RS2Y1PmJ/8/C
	MwNzjB/F7YTGYwekWr1VAqO7EdYiZRt8=
X-Received: by 2002:a2e:a98b:0:b0:396:8ac1:53a7 with SMTP id
 38308e7fff4ca-396d0831aebmr48391501fa.8.1780959965406; Mon, 08 Jun 2026
 16:06:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <20260604-grinning-determined-falcon-0e8b01@houat> <8d0a958c-2eaa-470d-b81f-3a6c436b8a7f@linaro.org>
 <20260608-esoteric-hilarious-spider-2d2cac@houat>
In-Reply-To: <20260608-esoteric-hilarious-spider-2d2cac@houat>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 01:05:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLnXd4_FTXjCAE-SRdTVZ3iBLKafqdL5GsLV=RqsuFOe0g@mail.gmail.com>
X-Gm-Features: AVVi8Cfx1v3s7VdobOaJDVYYhQmB92lNqfHy8LUuVXAd_BYDJSr6NchoutNFGbg
Message-ID: <CAD++jLnXd4_FTXjCAE-SRdTVZ3iBLKafqdL5GsLV=RqsuFOe0g@mail.gmail.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern age
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, ksummit@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2925-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87F7865B1FF

On Mon, Jun 8, 2026 at 12:19=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> > As Linus, Doug and Dmitry replied already, this is our biggest issue an=
d not
> > only Linux maintainers issues but also product makers like Open Linux p=
hones
> > which can only discuss with panel makers and are unable to match the do=
wnstream
> > Android capabilities.
>
> The best we can do for this though is to provide the infrastructure for
> them to contribute. We can't do more than that, or force them to
> contribute, or release doc, or...

I do point it out when this behaviour is embarrassing big companies
who are their customers:
https://lore.kernel.org/dri-devel/CAD++jL=3DJ1uFSF_Wr8sSfiDdeHoBNv59NY780i=
=3DBaO9sOyUxgiw@mail.gmail.com/

Yours,
Linus Walleij

