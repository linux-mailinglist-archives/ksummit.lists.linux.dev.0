Return-Path: <ksummit+bounces-2565-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3FBE44A7
	for <lists@lfdr.de>; Thu, 16 Oct 2025 17:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E18103B2C37
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE64434AB0A;
	Thu, 16 Oct 2025 15:36:45 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0634AAF2
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760629005; cv=none; b=AHi5Vu9UfF7Epz2RTMhBSs4VeOtylcYbXLqsq0m2OEdFyVjKQk7l2QNlcyZbeanGN7bCgWjP5/Irk+akPmQVimnWvVd5mazEjZJ1oF8expSYY2Wqwjbz5iel58GsOSqmS9202fQtHy8NKaj0N/Aa04Ay7dPcgrAsFd0R5nzXfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760629005; c=relaxed/simple;
	bh=S3BF8jDiROIbPLm6imHUfLrJitS1gfsFkuMIOR5lO1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz5iGyNZVW8SdHuxvv/ScF6Lus09jdtnQQXYi0wn8o1b+pCKn41Rov72zjkB65WV38mpuI/TGO5Dbh3SrrL9W512J6WidRB4SyhIplAn6heUsjLrEWka9N+72T2Z7WwWLg1vZM9/9IF/0+HhLynCL+NSC3LwJD6XkyCZ5UVDfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-554ff1682c8so642836e0c.1
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 08:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760629003; x=1761233803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4TnNaZPhqqHxJHVMc1sj21NLBgcB1bqiiIYUkOaNEU=;
        b=j3x+N1Jiz+O0R7le2BDYOZ1YSD78mzgXgUCkayjiyQHc+t0HamO4zGkgJ2vE1ssO8q
         c7p+AA3/3VoGrlDkdx0bACP8vZmonFVFl5wtXHDah4Gvh9SqKzE88Qc/En/mBfnFvb86
         hBI9LnW6VdpiP+EHXb4rC7pfl7UJ3luddZs+Ma7A+b97E32EaE69QwKR8hPgx8LTD482
         MNiMXWHhkrALLiz0m6vQf6Q8n7q6PmQMLpeVHrfx/p7xLAwnSQy02AQeY5/TM+lIGLG3
         Z8qZrvzR2CBA9fc0zqngrnLh2Hok37S/LLwoIq1rvl7tOgSnXri5xOzeQqZ8o7fopFHM
         Riog==
X-Forwarded-Encrypted: i=1; AJvYcCV0Z1RumavAVCEEkTpit111XeaHetgYs9iRg4tyBAoy7PzLJruCMDxcaBkH25JxXBrwmItXr/iw@lists.linux.dev
X-Gm-Message-State: AOJu0YwsgH8VcHOuBhvWWioqhYZN7TJ3U7BVDNtNWiXrldUeLmnWepgm
	4dPK7rchweK29aDLWomgv6hW2z5NaokawCkvRa9lsLjQvmgxj6zZ5dkXiJpyeL/U
X-Gm-Gg: ASbGncvYC5jTvK8zYbw4RNnzgO+aogBDsuFtEiTnv21ZioQq9IhybvzbMG4Ir5e7+h5
	RG0foZjyI9VlsCK+VAjjjC+hMRoHlVsuLXcQlDpsV2YxBxETr4/EyVhvpgimpyPHjWgKiarenth
	XoUr4mk+wU61DOaZAZ4ZRMnSt70Kmm2iKnM3AJOVs4HxC3k5Ah5TUSJnCkIwqc+Goh1CsZX4dS5
	hHSuCFcRT27OKrvGE16oqSTEaD9RvgI4wWd8qekzzB9NLNhj4+ZamrDsK+yjPes/Wabu/YfxYfH
	GvyZ/uKl7vawqZEmodDQ0f/N4/JLiNmMOIvPJjhThvxs63X2KDkm7w5cMIkS5Aj/Mo5kMSVO4/J
	nlo1PxGvLD0WmEYEktTQsx509ERrJuaiUrONbj3b68g8QjiNA89fidBAESnoKF9t1cWOjqxEA4A
	hQVM6nTw+ir13tPlcP4UrVRgUc0hdic2o292g+NA==
X-Google-Smtp-Source: AGHT+IF4HqYLKWfaqWzfpk3Eug/QF35dDx7I/PQ9fdedBUJ0p54KlD2lIYN8VlDvjwkmWYPSSfc5Aw==
X-Received: by 2002:a05:6122:1d11:b0:54a:9316:f429 with SMTP id 71dfb90a1353d-5564ee239efmr355201e0c.3.1760629002643;
        Thu, 16 Oct 2025 08:36:42 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80a453csm6068791e0c.13.2025.10.16.08.36.41
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:36:42 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso722715137.2
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 08:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3MC4aY2BsJc6rUYxSWNUHe4x9VI9aofsKr9iNU/No1FKifaKcpwk6lRK1n8alDrY7tMPoDMOY@lists.linux.dev
X-Received: by 2002:a05:6102:3f05:b0:51c:77b:297c with SMTP id
 ada2fe7eead31-5d7dd5ba67amr451070137.27.1760629001516; Thu, 16 Oct 2025
 08:36:41 -0700 (PDT)
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
 <20251016-vehement-kittiwake-of-joy-d6db8e@lemur> <CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com>
 <76340e9a1adf2f73b624992ae2da251826188b95.camel@HansenPartnership.com>
In-Reply-To: <76340e9a1adf2f73b624992ae2da251826188b95.camel@HansenPartnership.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 17:36:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVd11OBizXcYWhi73J5QfE+8SB1dhY_satpw37u3R8-Zg@mail.gmail.com>
X-Gm-Features: AS18NWDqJHhqm2a30QS9fJ4ZaU_S2EPo6iusPxGaKhsASYE_7_qU-6wOJ4bXr8U
Message-ID: <CAMuHMdVd11OBizXcYWhi73J5QfE+8SB1dhY_satpw37u3R8-Zg@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Rob Herring <robherring2@gmail.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, dan.j.williams@intel.com, 
	Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Thu, 16 Oct 2025 at 17:07, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Thu, 2025-10-16 at 09:58 -0500, Rob Herring wrote:
> [...]
> > With a new atom_type, there doesn't seem to be a simple way to turn
> > on or off a field in git-log. We'd need '--pretty=linus' or some new
> > git config setting.
>
> Well, not on a per field basis, no.  --pretty=raw will give you
> everything, though and "grep ^message-id" would pull it out, which I
> think would work for scripts.  If humans want to use it, I think, per
> Linus, we'd have some option to convert it to a clickable something.

Let's hope bug reporters who barely learnt how to run git bisect will
manage to find it...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

