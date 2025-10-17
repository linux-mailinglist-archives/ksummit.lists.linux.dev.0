Return-Path: <ksummit+bounces-2576-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCCBE7CAC
	for <lists@lfdr.de>; Fri, 17 Oct 2025 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1D7425EDB
	for <lists@lfdr.de>; Fri, 17 Oct 2025 09:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2A8316193;
	Fri, 17 Oct 2025 09:22:10 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2652D8DA9
	for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692930; cv=none; b=M9+bI41aSkuugIWbAJSZHtEyQ50FieaDMqKdfvEB+VzV9M3qCXgjQqPOP8qpYcNFsf5fRylD5FoXo0PRCOpDgF82o1DlZh9GZem1/odlHKmzhqW0g4nFuvSd+LyA+HoTOt6fLEdHEEMZufVrVnAOfR/mvGQOoTnVZz6KbqNFUQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692930; c=relaxed/simple;
	bh=z/qN/eG35OoXNecOfYtuoCdUE8MKSJ+dyxk9HBLsxjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fj1A+gV1ExNtWb8iZjIjwTZgRqXTbi9OnD62rStXTfN31sgn4hEz9uZqq1jZ1NT7VyXafM4wTOLOrIVPutDNzpXVNslxjy96rBZXC5UIgkPLxzoZt3ShJQ2DhRI/SwDbRKRuFMnwUSRFZDDXGrghNUhfHCiiHLEQdeD991Xl/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-930fe879d1dso540984241.3
        for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 02:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692926; x=1761297726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8cYThV2p+MmnDITossw4rCWueqgH5STywkMdsUa/JY=;
        b=VqE2YV5pkRq8jd1uMF3yTpO8JWR/99vQ2xGB6dZ9bmGpEkt0xcUF05EOn4oaFarsU7
         BnzX0f8U+j+YfRJ99kLFtvIdpQtbtmLl5vleNy5ABQm94ZnI5l2R4LhJ2gIz2fI7fyA9
         vGGO2SJb2hjUxwGMIaM+8K+ddq3xz+bfDDYQjwiYw+f+HtHn4sO0IP5DE9NqjFMn5dl8
         wK1lXvqoyV1xeCJd/fXMy5GQC0Vi4zoKGZL6l07kMkgssML/pQzMQNaVINVq/bgFQv2g
         128iP2UptC8brVY3YWSC1sPihDjCf9UWf4Dy7PTeKjOzSRVkRb9ztKJvkWyGWWOA5O2S
         SvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+fKDD0/dPON9Kf08oUk/gi+v4HNFawLmm82od8gOpFvikTCuAw3lgFhnfS1iSKHtG+ItVMua@lists.linux.dev
X-Gm-Message-State: AOJu0YxqbvenrHpfzlYERK5XVdLbZfwRXHbUaaC7dzH9CYtWcERlmJhf
	rJ0MFV8pzQidr7SCV7SxpE4JS1SgsDLBvhfbOSTmCfMIrB3tEgQLNmNWa5Psw5tv
X-Gm-Gg: ASbGncurqBSw8FU56IB4B71zukeH7ReKPHMou1EphyZPkFmrBoCoKQZyk+x8UhuJxWq
	iz6e6Jkz5DsR2BL9ySKP/mXoE/LgEmiQUjOgTzNOCFwke/8h4Sjp/TZ6IgpQyMGK9jxEAh7DBas
	oehPtjxmP12bOIwoGF8gDRuS/hmidiDfBZ4gDKJqh159rhvog+iEfrAmswHuhyY5CeQy59WKkIN
	79FNM2cnZ5w083+s/ueQZ/NkJX+4JAg13lrngeN8NutuJusxxNW3VNmPFOlYUTncgkYvz0PjmGD
	mB+bik8AptiCjWhjdLZX9eFnlEU3NRoru7bIfkGUEBp7MBllw96GFVl6yEkOpcvEQu5uYb1ks2K
	eCmjp8/EJe0P3eQZd9rZGBYnbP4U2hvjTE0Qfa8Ld/KtvtMOFxnkPtOxm25MiOPWm+Dy3DoKlkp
	NG5xPT8GfsYQTXf9VgkcKOTRDY/QyA4zTKsPmZzQ==
X-Google-Smtp-Source: AGHT+IFOTotJVqD1zWiGvtP5HDQdtbol9zYGxLJqgB+PYMr9IiL63vRDiBrDuE+hU4AfEOlyCg8wyQ==
X-Received: by 2002:a05:6102:c91:b0:5d6:2bf0:32ec with SMTP id ada2fe7eead31-5d7dd680940mr1123688137.37.1760692926390;
        Fri, 17 Oct 2025 02:22:06 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc927cf3sm7152857137.15.2025.10.17.02.22.05
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 02:22:05 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93106c58173so453217241.1
        for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 02:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM9ZYiNiA7RZ/SeCPmu5Ri6YBN3NsbaabXbHg18LKMxmmpZG3qqOAaDVeZL6Yk5ajWE3Vhk1MV@lists.linux.dev
X-Received: by 2002:a05:6102:390a:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d7dd6ba33emr1116812137.41.1760692925392; Fri, 17 Oct 2025
 02:22:05 -0700 (PDT)
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
 <CAD=FV=UAKneV0xOUxLMNuynPcOViBhKniDzUnAicSXKaTYg35g@mail.gmail.com> <89263430-4b2d-4992-a2fa-cef7f1e7b556@suse.cz>
In-Reply-To: <89263430-4b2d-4992-a2fa-cef7f1e7b556@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 11:21:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUomNgc2aGt=goZS=rKVXwB5zm2=ANwR7qdGE6gH5FQLw@mail.gmail.com>
X-Gm-Features: AS18NWCVLwFkuSgSvD5ASgppKaAKWEI-lge2PZwbdhxlAPVlahlWq8d3x9pbOLU
Message-ID: <CAMuHMdUomNgc2aGt=goZS=rKVXwB5zm2=ANwR7qdGE6gH5FQLw@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Doug Anderson <dianders@chromium.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Fri, 17 Oct 2025 at 10:44, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 10/17/25 04:27, Doug Anderson wrote:
> > On Thu, Oct 16, 2025 at 12:09=E2=80=AFPM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> >>
> >> Since Linus' intervention this may be unnecessary,
> >
> > Thanks to a tip from LWN, connecting this thread to the other
> > centithread on Link tags. Presumably this is what James meant about
> > "Linus' intervention"?
> >
> > Link: https://lore.kernel.org/all/CAHk-=3Dwj5MATvT-FR8qNpXuuBGiJdjY1kRf=
htzuyBSpTKR+=3DVtw@mail.gmail.com/
> >
> > As per standard Linux practices, please don't submit anything to
> > "Documentation" about this. Anyone who needs to know should be able to
> > find the current policy about Link: tags in the middle of a random
> > centithread. ;-) "Use the <mailing lists>, Luke." ;-)
>
> The documentation has existed for a while in
> Documentation/process/maintainer-tip.rst
>
>    You can also use ``Link:`` trailers to indicate the origin of the
>    patch when applying it to your git tree. In that case, please use the
>    dedicated ``patch.msgid.link`` domain instead of ``lore.kernel.org``.
>    This practice makes it possible for automated tooling to identify
>    which link to use to retrieve the original patch submission. For
>    example::
>
>      Link: https://patch.msgid.link/patch-source-message-id@here
>
> Since that file is strictly speaking about the tip tree, it would make se=
nse
> to promote it to something more generic?

That existed, too, but was removed in commit 944df7a31452f75b ("docs:
update the guidance for Link: tags") in v6.18-rc1.  That commit carries
a non-clickable Message-ID:-tag instead, and does not apply to Chinese
readers ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

