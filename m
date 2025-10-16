Return-Path: <ksummit+bounces-2563-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD0BE40B9
	for <lists@lfdr.de>; Thu, 16 Oct 2025 16:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA8319C6F37
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFF1341ACF;
	Thu, 16 Oct 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWMgLkqW"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7753254B7
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626712; cv=none; b=VpnHWMvZbL/l4L9qyEZL5cwWEbZwaylj0gtOPqsm2SMosOnrzOZqb/5AIljqtChqys7oX3pOJDhve0DHRcg+GUxcSutOjrCawhLxCVYgGP6GqxL5rVdDArogzFdONoSyJ6H819SH6RZRPg/jq10e1RT+vt7IToh/TzR3EU9e8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626712; c=relaxed/simple;
	bh=NmhS2ixsae63hgfZ32YIJDShB09vDisEzuBEFIDR1tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFnrN9tji8ldfkheo4c2q5G4WdZtIJBCRI6p3Zju/4wgT2defgYnfosbw+xPKDFhpxc/RrLiKrDddyOlzMqHRmrEUFqtoj0VUtzlquGBr04x4pQYbn7+SQP34yCmTZAWy0XVIDBM755GKGFx0hgEVgTocrQpi9XtlhHEpzvc8d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWMgLkqW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so1432866a12.2
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760626709; x=1761231509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiJZEXEfgr/5X7g9cOFpRdMiTnBkAvLQI7UzwnKi3gE=;
        b=lWMgLkqWSMjgEgkCndQXoPR6jg6Bnx9/9MNoczeqrqkXrS1Q820DXKL4/tfdolZkkR
         ZP0X/Gd0jNmuYVWqHqSNx/IQT5sFw3FTTyuGC2YaoxR0Mdlx4y02DisG2nJXNhj97zDK
         X6ibTVI8zDFMjpoHIemNN13/0kjYsQFNd2SK3tx/y+LxPRGoRLu1i8/3PgwK/0ISdruO
         pXDM7Lijw7VEeVdfenBBzI4k3Mlz/D/Ra/mMMWAkl8yADUVDCM/B83iMsIbA7vqzQzOy
         t6jJzxzFLjyZ0j+uSiVEh/5hsAuaRaW6AKjKIb7wXQw7Fiutg1jnahdmymF0qDNNm+nz
         wMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626709; x=1761231509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiJZEXEfgr/5X7g9cOFpRdMiTnBkAvLQI7UzwnKi3gE=;
        b=MWtruzKwI743GyjCFFAUrwHDTXl7wnHvbUkJLyunNLBzfluQH8na4oZ5N8i83WmT0Z
         goUbZeX8E0aoY2CbfiuJCabahaT+EW9dkVNmSih2y5f1YHpd4lPS0pC36Xg6BrQVhVUP
         nNDnLzYOYLKU9GnYogNcXJdY8M9M8+AR5B1T+RCd6I8Op06BNigeSqAgw3Qs0pq4c7Un
         +5GRnp/Ox5beBtrFKgtSA2dIRh28Vh5nxMGR8EyBnzAClRFksAOvrsNlaH4Wlmhi4YcI
         DBm5QbZjQlp0pVckEtIF4ZHHz1ODzMAyM+vjQPiOSgDVT/2fqyBgYAIA9o3JmRUqFhGc
         JDUw==
X-Forwarded-Encrypted: i=1; AJvYcCUsNVL+d2SaARnZ/hNbT78M2Ky/USha2YrO4N4iHzOzY6QhUjZwlA1xfxsLDQdy+5woYeUNU4L7@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt/ofGYnt6Bn1SrBtEeJHuZ74lhS6vE/N04Ii8UxrMaM/fiWBe
	HY5Z3DpmjQsvAyfX0YvgCtinFNr1jCRpievxP6tppcwvVuyPHrRvg3ZzaqMuQvWLxEw+xKV9Ca6
	K2MHv/cjQZrPx+IqlLu7y3g2pNs8VPO+7
X-Gm-Gg: ASbGncvPf3HZBftZUqa1cpMRuQVWp4stKsuxL9V5KFw+KUS42ZjypOS1zipTRuAPJLN
	e5LRZNlbbMhYj20ZPkR2dFuhjf08h7YFb0t2J/U90hBrlN4HTKWzB5NExsPEGF/nUZnZKe9W3Ww
	GQKuavT+aCCwmsJ6TK1LHbkLcnMx2CxSh+AzhxhDbxVLPSbbi2eHdhbclv/Fuu8+k/GFyJvFdKW
	6+m7jpcDU3itCvzj5pCjZNylXIV2bLHt8L3MbQHLQn/iq8MdHVORj3oYSBtg5t+nUvoT1lyHnYo
	fX2DlMuFw5cKCTOKwGjs88dI+QQ=
X-Google-Smtp-Source: AGHT+IFeORFAFTyCrZEUwmZxC/IVZdiZkmBX7iW+oQ+rMcr861L2NbkANli8xP4TORDJOZ4mjFqW45KntN8AcGuoy84=
X-Received: by 2002:a17:907:bb49:b0:b3c:82d5:2119 with SMTP id
 a640c23a62f3a-b647403a63amr21121266b.6.1760626708280; Thu, 16 Oct 2025
 07:58:28 -0700 (PDT)
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
 <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
In-Reply-To: <20251016-vehement-kittiwake-of-joy-d6db8e@lemur>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 16 Oct 2025 09:58:16 -0500
X-Gm-Features: AS18NWDdU6e8z4GVKJCii5MgToyqKxOsQJww2FkVqGLa-2FWF_AFIr2WcM-DUrU
Message-ID: <CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 8:02=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Oct 16, 2025 at 08:29:01AM -0400, James Bottomley wrote:
> > > Where exactly would that be added?  Are you suggesting that git add a
> > > new atom_type of ATOM_MESSAGEID or something like that?
> >
> > Yes, I think so ... just looking at constructing a patch now.
> > Regardless of the outcome of this debate it seems like a reasonable
> > (and not kernel specific) feature to add to git.
>
> I am wholeheartedly for this approach. One of the downsides of the curren=
t
> scheme is that Link: trailers can be pointing at multiple patch submissio=
ns
> (e.g. if the commit wants to highlight a related patch series), so withou=
t a
> clear indication which link is the provenance link, we still have potenti=
al
> for confusion.
>
> I recommend that we all stop beating the Link: trailer topic and sit on o=
ur
> hands until the above is either accepted or rejected by the git maintaine=
rs.

git-am already supports adding message-ID though to the commit msg
rather than the commit itself. A custom pager config could either hide
it or transform it into a lore link. That would avoid the need to wait
for a new git version to trickle out to everyone.

With a new atom_type, there doesn't seem to be a simple way to turn on
or off a field in git-log. We'd need '--pretty=3Dlinus' or some new git
config setting.

Rob

