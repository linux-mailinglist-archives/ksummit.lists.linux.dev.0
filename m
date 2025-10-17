Return-Path: <ksummit+bounces-2574-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FBBE61A3
	for <lists@lfdr.de>; Fri, 17 Oct 2025 04:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A802F4E25C4
	for <lists@lfdr.de>; Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4E223EABE;
	Fri, 17 Oct 2025 02:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFRQxOLD"
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD820B80B
	for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760668039; cv=none; b=iSe/QD2TglPpW/MtNh7is+5uiwsMCQRc34TEBVX/qpafpKGuyfdcuLuWun0ISUTroDav3AAHTlJwVOdljip3nJJQAqu164ZniVm5Mc0UuyOzgAIztHg9p8x4oB0cKm38D1NpBLGkyOlWe7PqwOt8j/Qk0yc919vJ95g9thfJo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760668039; c=relaxed/simple;
	bh=Na3BD7QrqPw+VTz30aNXOBllxC85/zV95br45vEyMjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPXDIDJ10cbJ0F4o+YAFwF+pRLHhuaSHVHneoyRJQL1Du7XJQMEptlnY1EXBxW4xBqcNFcfLZbqN+ysqIcL0foFb/n9fO1q3roz7goSOZ/U/YqsXOTKVKON5bjUG/f18LCvHx6fnhF1NGrLDMRDuTjtnGVTERtAEyFZWPPPHajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFRQxOLD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso701981a91.0
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 19:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760668036; x=1761272836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na3BD7QrqPw+VTz30aNXOBllxC85/zV95br45vEyMjA=;
        b=bFRQxOLDAdj8WZ8gG43FXHWzemmB2MdnW03fgKyF5rIm0h4Do/5H4oGnpoTVF+7MF3
         5kV2RTuQEjehbnp6H5hlm0uAIUIwddwnfvIZzU7yGhpLEKrmtKVusaKH8T66/h+xlRPd
         bvqC2ZRgGZedxolVaB9b3OJyUWzhFERfBQtVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760668036; x=1761272836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na3BD7QrqPw+VTz30aNXOBllxC85/zV95br45vEyMjA=;
        b=T+0p6Zqj6SptBdetxp0S+sUgJpI91ZXrknEBieIipDFdorApF5nV/kxAIq1zSFnYrg
         4Tp6HswCAasweZBOaROOEptLUpFunhSn+FNdi9M6xZJGptC4HCJChcbKNw96OFnzgrqk
         uoA9cAkPCLuGrmcvGf5z6SXfgyc/yqtK9/lOpCyg3fTSwPYLG/4jqYER1OyJ26wQPJvs
         XZasOaWPxsj/rtbMewK5N/+2y/2/ny91VGlF86PwF6529P3Jhsrt/kuEHegxBW5wrKBw
         2UedsxEBWAbeaP9opJOwI2d+6hG2MLoByLSjHg3LGVGjH9S7+lu/ClNZDtDIWLHDDPHb
         4lsg==
X-Forwarded-Encrypted: i=1; AJvYcCWvqa4IiCi1DtSL9Jns9BsWXYrjNDkrV0Zl1rs2mhaXUOrUq4yNrR1/KjGNWos/MCJVoVST9g71@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3y1v1Lqc5wEopVzqsVtceip6G+oGlm0B/VfLCx2WlPsmtw3ge
	Ao4JNQ166ut3vajbeC7Zzc0lzyotW+jFS9UktkKoiqsZySvI+R+wRgmHoapjZ2+3qRCO8AD5Lxe
	gq6Q=
X-Gm-Gg: ASbGncswF60VwzBu09xlR0CPREn9v5emUh5Vg8e+tmj0Mm7eWvVaLAClghwUmBoJV6o
	qwKqHIOu9aWwXP+UaT8ADgaScn90zOVAnyoVivNtBpTXXKZnsA4oQpUvP2pCzlypl3pvpRh5D8F
	0pRC/otuuTdPpxUzRPPt7/MvgM48vLAEnXh2Q8nhbK8m7Ku6qi8u8eKQFVwGuwdiDMUTCcXyPjI
	zh+bqIlOFw4Ehwm90RIK9uB4WtedT0swg8WyEGkJ/C0H9BBAbFFuX4E1Yfxx3y+xmauucDFWGrv
	a+fAEQfA3sk7TlihMJ76OXISawIknOC6HSAnXyRS0rIXUxAWJw2xmMh+/LYuS87qbcHHK3/lbZj
	a+2DU9nQwFZfwVvZkDYSUgKsGzReL+VVE2EOs3Znq5L4qnm9FStBJa8z2quRoxJ8MqkSbr8GRZi
	uEx4qeRwNAGtWtM+xmc4MTkBLqHJybXSRh0qjRAx23cWI=
X-Google-Smtp-Source: AGHT+IHIgu2SJ7w4E9s+xdmz0gHMFGHKRnxRLmn50FAr/ku3CFcfONAy/x152I+OadhEWnMzz03q9g==
X-Received: by 2002:a17:90b:55cb:b0:33b:b0f7:fdc3 with SMTP id 98e67ed59e1d1-33bcf85883bmr2285791a91.8.1760668036380;
        Thu, 16 Oct 2025 19:27:16 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd79b50c9sm967659a91.4.2025.10.16.19.27.13
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 19:27:14 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b553412a19bso952245a12.1
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 19:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTlzKrAZyRXXOPeQPuU2wNkuTskQBeAgBxWZZyScErsD5c9uM5o+WGD9o5oDMDYQEqiMc/GPWF@lists.linux.dev
X-Received: by 2002:a17:902:f552:b0:290:6b30:fb3 with SMTP id
 d9443c01a7336-290c9ca32eemr27548045ad.16.1760668033144; Thu, 16 Oct 2025
 19:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh> <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur> <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh> <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh> <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com>
 <20251016-vehement-kittiwake-of-joy-d6db8e@lemur> <5f668197447a5eb5036199c8c95e9dcae723190e.camel@HansenPartnership.com>
In-Reply-To: <5f668197447a5eb5036199c8c95e9dcae723190e.camel@HansenPartnership.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Oct 2025 19:27:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UAKneV0xOUxLMNuynPcOViBhKniDzUnAicSXKaTYg35g@mail.gmail.com>
X-Gm-Features: AS18NWBUxZAICmoDqBUQo0fz0BQrmKQBt85ziNBtID7S-I1paEHoe5-R8B6_Zs4
Message-ID: <CAD=FV=UAKneV0xOUxLMNuynPcOViBhKniDzUnAicSXKaTYg35g@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 16, 2025 at 12:09=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Since Linus' intervention this may be unnecessary,

Thanks to a tip from LWN, connecting this thread to the other
centithread on Link tags. Presumably this is what James meant about
"Linus' intervention"?

Link: https://lore.kernel.org/all/CAHk-=3Dwj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzu=
yBSpTKR+=3DVtw@mail.gmail.com/

As per standard Linux practices, please don't submit anything to
"Documentation" about this. Anyone who needs to know should be able to
find the current policy about Link: tags in the middle of a random
centithread. ;-) "Use the <mailing lists>, Luke." ;-)

-Doug

