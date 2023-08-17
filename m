Return-Path: <ksummit+bounces-1006-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9B77F821
	for <lists@lfdr.de>; Thu, 17 Aug 2023 15:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C471C21331
	for <lists@lfdr.de>; Thu, 17 Aug 2023 13:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1BE14A8E;
	Thu, 17 Aug 2023 13:56:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FB1427B
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 13:56:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d71c3a32e1aso1510412276.3
        for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692280614; x=1692885414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHKV6taA3MamNu9ILTprnW5wjU6x+bv45cer1bn1Xwc=;
        b=Oa3lyvmSIWNB4jrtc5krWgUx8URgk7qasg9rXiXtrYhLoKYlD2ucVq9pdmfBdAD7J0
         cvg9572Ns6YCswcWbq8Fk4bNgJ3cLHjTBJcdO+guZLGHktOK0vfsUaV1V1NgTDWNldF/
         jKTEhYuisfBJuxdAPPQN6UvR9iOLlusSZPOJfcib7BCR+5Eqg5wC+sme4ldOcEDIuQRw
         5y5nmT4t3riAE+mTRR/l2HEmNb+hXQx7KlQ58UMOcX/GnS7+zNFKazVIu95p04A2OOdb
         GIP4iNLyAwgoLlXCFTL9t9or7sAo6PQ6V3cymCZ800aNENkW6SnFD7xFTDq/3xGYmtFy
         2+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692280614; x=1692885414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHKV6taA3MamNu9ILTprnW5wjU6x+bv45cer1bn1Xwc=;
        b=VnkD+ycHHVhfUjuoz5JjvVjcd/FBgYV+KY5GBDaO048E9Xt01ZXbbWzz9s3XZQQ1+B
         SMzuLWT3+X2t9m70vgD5xDQA0HTktwEyK6JDUYe9frCe5Cp2Yq2YLrsGpEvfzGDierru
         gZ+wjiRBWViEjicOaqKXOQYuV6D+U3ka8sXEvEzCtwmdLiZJ27iVbqHnKwHhXffpA2+n
         0jrNJ6rKGDWow7vgGUZqdZfzh8JXIVyR6lKp+2nAVqNxVuXDCulb11JzY3rxdlWhA66i
         sQx7CaO3ge5JEZOrvrn74C3jRtBfIgxXZK7AAO/aPnyz2cuUXqwMph0C+aA7FAe/ZQgy
         YezA==
X-Gm-Message-State: AOJu0Yw9wMyxSr9A5aHEpGszfqBZ1NWskGWsf2/cS0V/qhqOY4NyScFt
	4zoQWHlxJAS3Di9APsGbLzwSU2P2g4TmBXYhv9M=
X-Google-Smtp-Source: AGHT+IEFxljar8LFQhboSpDmUCHS+UfWWZx6eTavyXY4xMNIKbPlOxCCiQOGT5FvPn+EFooLJqqGFJa9dhVxtvWlMVE=
X-Received: by 2002:a25:aa0a:0:b0:d43:2687:364a with SMTP id
 s10-20020a25aa0a000000b00d432687364amr4731850ybi.48.1692280614630; Thu, 17
 Aug 2023 06:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com> <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
In-Reply-To: <20230817124255.GI21668@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Aug 2023 15:56:43 +0200
Message-ID: <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 2:42=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> I think the rules will need to be somehow flexible. As Jani mentioned,
> there's a genuine need to be able to discuss design questions before a
> patch series reaches perfection (experienced developers will usually
> know that they should mark their series as RFC in that case, but
> newcomers may not have this tribal knowledge). On the other hand, I'm
> not going to discuss the design behind a patch series if the code is
> intended with 3 spaces and uses CamelCase.
>
> Reports from automated tests, or automated reviews, should be designed
> to help the submitter, not to scold and discourage them. I'm pretty sure
> we can come up with wording that will be nicer to read than what I would
> write when being tired at 3:00am, repeating the same comment for the
> 50th time.

I think the bot should simply reply commenting on the issues it has
found, without judging whether the patch should or should not be
reviewed (and the bot could perhaps explicitly say so to avoid
submitters getting discouraged).

Then, depending on what the bot finds, i.e. the amount and kind of
issues, reviewers can decide and reply as needed. RFC patches could be
skipped by the bot.

This would already save a ton of time for reviewers, and it would help
new contributors understand the requirements.

However, a worry that I have about such a system is if people start to
spam unprepared patches until they pass. If that becomes a problem,
then a possible solution could be to have a staging list for that (or
server or similar).

Cheers,
Miguel

