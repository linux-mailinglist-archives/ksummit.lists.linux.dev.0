Return-Path: <ksummit+bounces-157-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D4369805
	for <lists@lfdr.de>; Fri, 23 Apr 2021 19:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9AD4E3E56B5
	for <lists@lfdr.de>; Fri, 23 Apr 2021 17:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB612FA8;
	Fri, 23 Apr 2021 17:09:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414271
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 17:09:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E70526113B;
	Fri, 23 Apr 2021 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619197771;
	bh=/bu7PKKm0NOEYj2utPFr3lw297biCTKe2oTu3AhjXqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPeqnXrpe2i0uT3VVb4jlApTbLcmfDCf5aO/IaJRZ7cyV8IhMMLqMf5o+t4wWwBYg
	 3+GC9jd/yt8LETpZvJwkAhN78PqC2viUnD/eoNmzowCU3taPwLy1kv+l9HubEEqPW2
	 RZetR4+hzlreSKdxdKOWw5ZiG/RRfXzxKeSMW0RDmjfFLz16unOx3JFz6PxObyWx+3
	 sXXrL2li5htlhB3oiBIc6pKpMZmV2PlwzWxM0N/rQ6Mm2H3gCalPjcs8nKiZ+NCmSK
	 obUeNpeRqjHCatME87bWfx9AAlMvWWUYq63UmA7GcO14rO0QBajiHkzWPkl/v8Ip8C
	 njdo1l9wT4Bhw==
Date: Fri, 23 Apr 2021 20:09:27 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Shuah Khan <skhan@linuxfoundation.org>, ksummit@lists.linux.dev,
	Greg KH <greg@kroah.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIL/R6muJl7soDfY@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
 <20210422115235.0526dabd@gandalf.local.home>
 <20210423095830.684d22c4@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423095830.684d22c4@coco.lan>

On Fri, Apr 23, 2021 at 09:58:30AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 22 Apr 2021 11:52:35 -0400
> Steven Rostedt <rostedt@goodmis.org> escreveu:
> 
> > On Thu, 22 Apr 2021 08:48:21 -0700
> > James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > 
> > > On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
> > > [...]  
> > > >    2. Improving the requirement for bug fixes and large series, like
> > > > cover letters to everyone, adding fixes: tag and clear explanation.    
> > > 
> > > Just on this one, can we get the mailing list to help now we're moving
> > > to a new infrastructure?  I was already thinking of asking if it could
> > > reject email with html parts rather than simply losing it, but perhaps
> > > it could reject threaded submissions where the cover letter isn't
> > > correctly cc'd?  I know that's a big ask because there has to be an
> > > easy way to recognize them (heuristics on the PATCH tag?) and a way to
> > > recognize missing cc's (perhaps simply that someone cc'd on the
> > > threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)  
> > 
> > Unfortunately, this breaks all quilt users, as quilt does not support this.
> 
> This will also break patch series that touch several subsystems.
> 
> Out of curiosity, I ran my script letting it to place at the cover letter
> maintainers, reviewers and mailing lists, for this patch series:
> 
> 	[PATCH 000/190] Revertion of all of the umn.edu commits
> 	https://lore.kernel.org/lkml/YIJyzkgglMrAzIwh@kroah.com/T/#m087445f69f5dd590b9ad5f4cdd62c2a812956435
> 
> The number of e-mails to be C/c is 221 e-mails! (see enclosed)
> 
> An e-mail like that will almost for sure be ignored by  all mail
> servers[1], as the e-mail will be considered as SPAM.
> 
> [1] Except if the servers would have explicit rules to allow such
>     really big c/c list to be accepted from maintainers, which is
>     risky.
> 
> Looking at the actual e-mail from Greg at lore, the CC list was a lot
> smaller than that:
> 
> Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
>         Linus Torvalds <torvalds@linux-foundation.org>,
>         Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
>         Qiushi Wu <wu000273@umn.edu>, x86@kernel.org,
>         Bjorn Helgaas <bhelgaas@google.com>,
>         "Rafael J. Wysocki" <rjw@rjwysocki.net>,
>         Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
>         Michael Turquette <mturquette@baylibre.com>,
>         Bjorn Andersson <bjorn.andersson@linaro.org>,
>         Linus Walleij <linus.walleij@linaro.org>,
>         Bartosz Golaszewski <bgolaszewski@baylibre.com>,
>         Daniel Vetter <daniel@ffwll.ch>,
>         Jean Delvare <jdelvare@suse.com>,
>         Guenter Roeck <linux@roeck-us.net>,
>         Jiri Kosina <jikos@kernel.org>, Will Deacon <will@kernel.org>,
>         Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
>         Jakub Kicinski <kuba@kernel.org>,
>         "David S. Miller" <davem@davemloft.net>,
>         Johan Hovold <johan@kernel.org>,
>         Jiri Slaby <jirislaby@kernel.org>,
>         Pablo Neira Ayuso <pablo@netfilter.org>,
>         Johannes Berg <johannes@sipsolutions.net>,
>         Takashi Iwai <tiwai@suse.com>
> 
> (Not sure what criteria Greg used to shorten the C/c list)
> 
> Thanks,
> Mauro
> 
> ---
> 
> The auto-generated list of c/c is:

Something wrong with this list, reverted RDMA commits should generate
Cc: Jason Gunthorpe and Doug Ledford

Thanks

> 
> patches/tmp/0000-cover-letter.patch:
>     Cc: "David S. Miller" <davem@davemloft.net>
>     Cc: "H. Peter Anvin" <hpa@zytor.com>
>     Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
>     Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>     Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
>     Cc: "Michael S. Tsirkin" <mst@redhat.com>
>     Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>     Cc: Adit Ranadive <aditr@vmware.com>
>     Cc: Alan Stern <stern@rowland.harvard.edu>
>     Cc: Alasdair Kergon <agk@redhat.com>
>     Cc: Alessandro Zummo <a.zummo@towertech.it>
>     Cc: Alex Elder <elder@kernel.org>
>     Cc: Alex Williamson <alex.williamson@redhat.com>
>     Cc: Alexander Aring <alex.aring@gmail.com>
>     Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>     Cc: Alexandre Bounine <alex.bou9@gmail.com>
>     Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>     Cc: Alim Akhtar <alim.akhtar@samsung.com>
>     Cc: Amitkumar Karwar <amitkarwar@gmail.com>
>     Cc: Andreas Noever <andreas.noever@gmail.com>
>     Cc: Andrew Jeffery <andrew@aj.id.au>
>     Cc: Andrew Lunn <andrew@lunn.ch>
>     Cc: Andrzej Hajda <a.hajda@samsung.com>
>     Cc: Andy Gross <agross@kernel.org>
>     Cc: Ard Biesheuvel <ardb@kernel.org>
>     Cc: Arnd Bergmann <arnd@arndb.de>
>     Cc: Avri Altman <avri.altman@wdc.com>
>     Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>     Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>     Cc: Benoit Parrot <bparrot@ti.com>
>     Cc: Benson Leung <bleung@chromium.org>
>     Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>     Cc: Borislav Petkov <bp@alien8.de>
>     Cc: Chas Williams <3chas3@gmail.com>
>     Cc: Chen-Yu Tsai <wens@csie.org>
>     Cc: Chris Leech <cleech@redhat.com>
>     Cc: Chris Snook <chris.snook@gmail.com>
>     Cc: Clemens Ladisch <clemens@ladisch.de>
>     Cc: Cornelia Huck <cohuck@redhat.com>
>     Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>     Cc: Daniel Vetter <daniel@ffwll.ch>
>     Cc: David Ahern <dsahern@kernel.org>
>     Cc: David Airlie <airlied@linux.ie>
>     Cc: David Rhodes <david.rhodes@cirrus.com>
>     Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>     Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>     Cc: Erik Andren <erik.andren@gmail.com>
>     Cc: Ezequiel Garcia <ezequiel@collabora.com>
>     Cc: Fabio Estevam <festevam@gmail.com>
>     Cc: Felipe Balbi <balbi@kernel.org>
>     Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
>     Cc: Florian Fainelli <f.fainelli@gmail.com>
>     Cc: Florian Westphal <fw@strlen.de>
>     Cc: Gabriel Somlo <somlo@cmu.edu>
>     Cc: Ganapathi Bhat <ganapathi017@gmail.com>
>     Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Cc: Guenter Roeck <groeck@chromium.org>
>     Cc: Guenter Roeck <linux@roeck-us.net>
>     Cc: Hans Verkuil <hverkuil@xs4all.nl>
>     Cc: Hans de Goede <hdegoede@redhat.com>
>     Cc: Heiko Stuebner <heiko@sntech.de>
>     Cc: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
>     Cc: Ingo Molnar <mingo@redhat.com>
>     Cc: Jacob Chen <jacob-chen@iotwrt.com>
>     Cc: Jakub Kicinski <kuba@kernel.org>
>     Cc: James Morse <james.morse@arm.com>
>     Cc: James Schulman <james.schulman@cirrus.com>
>     Cc: Jan Kara <jack@suse.com>
>     Cc: Jaroslav Kysela <perex@perex.cz>
>     Cc: Jean Delvare <jdelvare@suse.com>
>     Cc: Jean-Paul Roubelat <jpr@f6fbb.org>
>     Cc: Jernej Skrabec <jernej.skrabec@siol.net>
>     Cc: Jiri Kosina <jikos@kernel.org>
>     Cc: Joerg Roedel <joro@8bytes.org>
>     Cc: Johan Hovold <johan@kernel.org>
>     Cc: Johannes Berg <johannes@sipsolutions.net>
>     Cc: John Fastabend <john.fastabend@gmail.com>
>     Cc: Jon Maloy <jmaloy@redhat.com>
>     Cc: Jonathan Cameron <jic23@kernel.org>
>     Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
>     Cc: KP Singh <kpsingh@kernel.org>
>     Cc: Kalle Valo <kvalo@codeaurora.org>
>     Cc: Karsten Keil <isdn@linux-pingi.de>
>     Cc: Kirti Wankhede <kwankhede@nvidia.com>
>     Cc: Krzysztof Kozlowski <krzk@kernel.org>
>     Cc: Krzysztof Opasiak <k.opasiak@samsung.com>
>     Cc: Lars-Peter Clausen <lars@metafoo.de>
>     Cc: Lee Duncan <lduncan@suse.com>
>     Cc: Linus Walleij <linus.walleij@linaro.org>
>     Cc: Marcin Wojtas <mw@semihalf.com>
>     Cc: Mark Brown <broonie@kernel.org>
>     Cc: Mark Greer <mgreer@animalcreek.com>
>     Cc: Martin KaFai Lau <kafai@fb.com>
>     Cc: Matt Porter <mporter@kernel.crashing.org>
>     Cc: Matthias Schwarzott <zzam@gentoo.org>
>     Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>     Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>     Cc: Maxime Ripard <mripard@kernel.org>
>     Cc: Michael Jamet <michael.jamet@intel.com>
>     Cc: Michael Turquette <mturquette@baylibre.com>
>     Cc: Michal Ostrowski <mostrows@earthlink.net>
>     Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>     Cc: Mike Snitzer <snitzer@redhat.com>
>     Cc: NXP Linux Team <linux-imx@nxp.com>
>     Cc: Oder Chiou <oder_chiou@realtek.com>
>     Cc: Pablo Neira Ayuso <pablo@netfilter.org>
>     Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>     Cc: Pavel Machek <pavel@ucw.cz>
>     Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>     Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
>     Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
>     Cc: Philipp Zabel <p.zabel@pengutronix.de>
>     Cc: Ping-Ke Shih <pkshih@realtek.com>
>     Cc: Pravin B Shelar <pshelar@ovn.org>
>     Cc: Richard Genoud <richard.genoud@gmail.com>
>     Cc: Rob Herring <robh@kernel.org>
>     Cc: Robert Foss <robert.foss@linaro.org>
>     Cc: Robert Richter <rric@kernel.org>
>     Cc: Russell King <linux@armlinux.org.uk>
>     Cc: SHA-cyfmac-dev-list@infineon.com
>     Cc: Sascha Hauer <s.hauer@pengutronix.de>
>     Cc: Sebastian Reichel <sre@kernel.org>
>     Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>
>     Cc: Shawn Guo <shawnguo@kernel.org>
>     Cc: Simon Horman <simon.horman@netronome.com>
>     Cc: Siva Rebbagondla <siva8118@gmail.com>
>     Cc: Solomon Peachy <pizza@shaftnet.org>
>     Cc: Song Liu <songliubraving@fb.com>
>     Cc: Stefan Schmidt <stefan@datenfreihafen.org>
>     Cc: Stefano Stabellini <sstabellini@kernel.org>
>     Cc: Stephen Boyd <sboyd@kernel.org>
>     Cc: Steven Rostedt <rostedt@goodmis.org>
>     Cc: Takashi Iwai <tiwai@suse.com>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Cc: Todor Tomov <todor.too@gmail.com>
>     Cc: Tony Lindgren <tony@atomide.com>
>     Cc: VMware PV-Drivers <pv-drivers@vmware.com>
>     Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
>     Cc: Vinod Koul <vkoul@kernel.org>
>     Cc: Vivien Didelot <vivien.didelot@gmail.com>
>     Cc: Vladimir Oltean <olteanv@gmail.com>
>     Cc: Will Deacon <will@kernel.org>
>     Cc: Xinming Hu <huxinming820@gmail.com>
>     Cc: Xue Liu <liuxuenetmail@gmail.com>
>     Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
>     Cc: Ying Xue <ying.xue@windriver.com>
>     Cc: Yonghong Song <yhs@fb.com>
>     Cc: alsa-devel@alsa-project.org
>     Cc: amd-gfx@lists.freedesktop.org
>     Cc: bpf@vger.kernel.org
>     Cc: brcm80211-dev-list.pdl@broadcom.com
>     Cc: clang-built-linux@googlegroups.com
>     Cc: coreteam@netfilter.org
>     Cc: dev@openvswitch.org
>     Cc: dm-devel@redhat.com
>     Cc: dmaengine@vger.kernel.org
>     Cc: dri-devel@lists.freedesktop.org
>     Cc: ecryptfs@vger.kernel.org
>     Cc: greybus-dev@lists.linaro.org
>     Cc: intel-wired-lan@lists.osuosl.org
>     Cc: iommu@lists.linux-foundation.org
>     Cc: kvm@vger.kernel.org
>     Cc: libertas-dev@lists.infradead.org
>     Cc: linux-acpi@vger.kernel.org
>     Cc: linux-afs@lists.infradead.org
>     Cc: linux-arm-kernel@lists.infradead.org
>     Cc: linux-arm-msm@vger.kernel.org
>     Cc: linux-aspeed@lists.ozlabs.org
>     Cc: linux-atm-general@lists.sourceforge.net
>     Cc: linux-audit@redhat.com
>     Cc: linux-clk@vger.kernel.org
>     Cc: linux-edac@vger.kernel.org
>     Cc: linux-efi@vger.kernel.org
>     Cc: linux-fbdev@vger.kernel.org
>     Cc: linux-gpio@vger.kernel.org
>     Cc: linux-hams@vger.kernel.org
>     Cc: linux-hwmon@vger.kernel.org
>     Cc: linux-iio@vger.kernel.org
>     Cc: linux-input@vger.kernel.org
>     Cc: linux-kernel@vger.kernel.org
>     Cc: linux-leds@vger.kernel.org
>     Cc: linux-media@vger.kernel.org
>     Cc: linux-mmc@vger.kernel.org
>     Cc: linux-nfc@lists.01.org
>     Cc: linux-nfs@vger.kernel.org
>     Cc: linux-nvdimm@lists.01.org
>     Cc: linux-nvidia@lists.surfsouth.com
>     Cc: linux-omap@vger.kernel.org
>     Cc: linux-pci@vger.kernel.org
>     Cc: linux-pm@vger.kernel.org
>     Cc: linux-raid@vger.kernel.org
>     Cc: linux-rdma@vger.kernel.org
>     Cc: linux-renesas-soc@vger.kernel.org
>     Cc: linux-rockchip@lists.infradead.org
>     Cc: linux-rtc@vger.kernel.org
>     Cc: linux-s390@vger.kernel.org
>     Cc: linux-samsung-soc@vger.kernel.org
>     Cc: linux-scsi@vger.kernel.org
>     Cc: linux-serial@vger.kernel.org
>     Cc: linux-spi@vger.kernel.org
>     Cc: linux-staging@lists.linux.dev
>     Cc: linux-stm32@st-md-mailman.stormreply.com
>     Cc: linux-sunxi@lists.linux.dev
>     Cc: linux-tegra@vger.kernel.org
>     Cc: linux-usb@vger.kernel.org
>     Cc: linux-wireless@vger.kernel.org
>     Cc: linux-wpan@vger.kernel.org
>     Cc: netdev@vger.kernel.org
>     Cc: netfilter-devel@vger.kernel.org
>     Cc: nouveau@lists.freedesktop.org
>     Cc: ocfs2-devel@oss.oracle.com
>     Cc: open-iscsi@googlegroups.com
>     Cc: oss-drivers@netronome.com
>     Cc: patches@opensource.cirrus.com
>     Cc: qemu-devel@nongnu.org
>     Cc: rds-devel@oss.oracle.com
>     Cc: target-devel@vger.kernel.org
>     Cc: tipc-discussion@lists.sourceforge.net
>     Cc: usb-storage@lists.one-eyed-alien.net
>     Cc: x86@kernel.org
>     Cc: xen-devel@lists.xenproject.org
> Number of Cc at cover: 221
> 
> 

