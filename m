Return-Path: <ksummit+bounces-2577-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDCFBE7FFE
	for <lists@lfdr.de>; Fri, 17 Oct 2025 12:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC28556540A
	for <lists@lfdr.de>; Fri, 17 Oct 2025 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567B231E0EB;
	Fri, 17 Oct 2025 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLIpfzeG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7031DDB9
	for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695755; cv=none; b=B3yw6oeKKGIZwO9lJdpK1AT1UIvy1wFKf838F6JEd2hGB0KbbqR5BfvyM3FfN2s92T1gcKwwlrA7U/45HbcmIv/8CZHxyIdZ4yp2202iq/PSeuitpbeKEp7B5ucIYEF9WqMS0+EJ/+zLCUUIeOryjv3TQa3ax2Rdll2CWW6agm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695755; c=relaxed/simple;
	bh=kcBCKvBehwuzeeNpBAE5CGo3uaSXC/RW+9C1AFkPe+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyY82yzwdgpRuvpd2y2s+pGin/cuQctSC7TKPnM7WsxTP8+atgmrjehA2yZOFbK0RdTQ/PjfbYyyAWTlQEf5RCXJiD6aC1YXp1xnXSUcNEy4ZSY2kQMtY7B95NfQ60draQUrNof3z0K51Wr0A3d5V8e975mW7xfDUXRKWf0NCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLIpfzeG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CF3C4CEFE
	for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760695755;
	bh=kcBCKvBehwuzeeNpBAE5CGo3uaSXC/RW+9C1AFkPe+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eLIpfzeGsuzCxaqCjECUFwcdYE+gyQaHKH9eSq2e+oK99R0aX1Zp8N0mcLNWapufL
	 2Q8jWi4o9krYpYDz4zQl1O9wmx/mtfOLCaXkEP9/92lovWxqFDvxCaMbVXzvLztE5m
	 3MVvm7iVz03CrS2HPAo+q38GwsnZhO1tmMRby2EDIdg3Xdjw0j1esKzBav++UIX0Jz
	 DP7wMTD53ZaV3VXbjicTUvEsmkyNlV0IVmZsHb0gstzxtvpLWhY/IrBm8EhWEZtSKl
	 ay3Q/1UraP4FfcFwUiRPGqKIUsWmu67O8Dz3+hXX+rrWzI+PrCBsihbX7KRJwfjKql
	 G3yAphaX4I83Q==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c281c649ccso262321a34.2
        for <ksummit@lists.linux.dev>; Fri, 17 Oct 2025 03:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV49TH1mJyAeTegCMZAlxR76R8NZ6rsram55taS5QlPue4tJu/U0PIgnFHyx2Rqwjnm2ge3vxCn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9pjO1qUWeb7MLYz0SvNMN52dikiF1XCbkzF4mDA366LFw2ABE
	Mgkm2pAA/j70Qk6A8AphaLxLfKjSwd7l5gBy4CtVZd0tcdpk4a0MZkiNFpkHV6BrDR6s2jO/ooi
	xGaJ6ffaqOQcoWwSbCPWypgx8vtHdsB0=
X-Google-Smtp-Source: AGHT+IEmvA5f7FJeUmq06gqkyHtEdQkQOnWiWotl0Jx8nPhGzGfuA/6FsEo1S7ZEMSzgPZBCe4xwpxFQ0OTGXFbYczI=
X-Received: by 2002:a05:6808:4442:b0:43f:ba16:9fa1 with SMTP id
 5614622812f47-443a2f1b95emr1210407b6e.20.1760695754510; Fri, 17 Oct 2025
 03:09:14 -0700 (PDT)
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
 <CAD=FV=UAKneV0xOUxLMNuynPcOViBhKniDzUnAicSXKaTYg35g@mail.gmail.com>
 <89263430-4b2d-4992-a2fa-cef7f1e7b556@suse.cz> <CAMuHMdUomNgc2aGt=goZS=rKVXwB5zm2=ANwR7qdGE6gH5FQLw@mail.gmail.com>
In-Reply-To: <CAMuHMdUomNgc2aGt=goZS=rKVXwB5zm2=ANwR7qdGE6gH5FQLw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 Oct 2025 12:09:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h8BERjkmcUjdG=SkoLh6QjO_WpQ2br5ewQ2SykVw1=Dg@mail.gmail.com>
X-Gm-Features: AS18NWAFhctPMtjGW770Heavjb_9vFjMqmeBX72nxj5knK8XnVmT-yAxXOkg_EQ
Message-ID: <CAJZ5v0h8BERjkmcUjdG=SkoLh6QjO_WpQ2br5ewQ2SykVw1=Dg@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Doug Anderson <dianders@chromium.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 11:31=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Vlastimil,
>
> On Fri, 17 Oct 2025 at 10:44, Vlastimil Babka <vbabka@suse.cz> wrote:
> > On 10/17/25 04:27, Doug Anderson wrote:
> > > On Thu, Oct 16, 2025 at 12:09=E2=80=AFPM James Bottomley
> > > <James.Bottomley@hansenpartnership.com> wrote:
> > >>
> > >> Since Linus' intervention this may be unnecessary,
> > >
> > > Thanks to a tip from LWN, connecting this thread to the other
> > > centithread on Link tags. Presumably this is what James meant about
> > > "Linus' intervention"?
> > >
> > > Link: https://lore.kernel.org/all/CAHk-=3Dwj5MATvT-FR8qNpXuuBGiJdjY1k=
RfhtzuyBSpTKR+=3DVtw@mail.gmail.com/
> > >
> > > As per standard Linux practices, please don't submit anything to
> > > "Documentation" about this. Anyone who needs to know should be able t=
o
> > > find the current policy about Link: tags in the middle of a random
> > > centithread. ;-) "Use the <mailing lists>, Luke." ;-)
> >
> > The documentation has existed for a while in
> > Documentation/process/maintainer-tip.rst
> >
> >    You can also use ``Link:`` trailers to indicate the origin of the
> >    patch when applying it to your git tree. In that case, please use th=
e
> >    dedicated ``patch.msgid.link`` domain instead of ``lore.kernel.org``=
.
> >    This practice makes it possible for automated tooling to identify
> >    which link to use to retrieve the original patch submission. For
> >    example::
> >
> >      Link: https://patch.msgid.link/patch-source-message-id@here
> >
> > Since that file is strictly speaking about the tip tree, it would make =
sense
> > to promote it to something more generic?
>
> That existed, too, but was removed in commit 944df7a31452f75b ("docs:
> update the guidance for Link: tags") in v6.18-rc1.  That commit carries
> a non-clickable Message-ID:-tag instead, and does not apply to Chinese
> readers ;-)

So I guess it can be restored in a more generic form (maybe along with
some specific examples of what that information is used for), but
instead of saying "In that case, please use the dedicated
``patch.msgid.link`` domain instead of ``lore.kernel.org``", I would
say "In that case, the dedicated ``patch.msgid.link`` domain must be
used instead of ``lore.kernel.org``".

